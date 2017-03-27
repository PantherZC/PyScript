#encoding:utf-8
from bottle import get, post, route, request, run
import os
import datetime

#DB Index Page  ---------------------------------------------------------------------------------------------------------------------

@route('/dbservice')
def db_index():
    return '''
            <html>
            <body>
            <p><a href="/dumpdb">创建AD测试数据库</a><br></p>
            <p><a href="/updatedb">更新AD测试数据</a><br></p>
            <p>注：idea_time加载未来一周内的数据。<br></p>
            </body>
            </html>
            '''
    
    
#Create & Dump  DB  ---------------------------------------------------------------------------------------------------------------------

@get('/dumpdb') # or @route('/login') 
def dumpdb_form(): 
    return '''<form method="POST"> 
                <p>创建AD测试数据库<br></p>
                <p>源数据库：<br>
                sourceip:<input name="sourceip" type="text" /><br>
                sourcedb:<input name="sourcedb" type="text" /><br></p>
                <p>目标数据库：<br>
                targetip:<input name="targetip" type="text" /><br>
                targetdb:<input name="targetdb" type="text" /><br></p>
                <input type="submit" name="submit" value="submit" /><br>
                <p>注：执行过程大概需要15分钟。<br><br></p>
                <p><a href="/dbservice">返回</a><br></p>
              </form>''' 
 
@post('/dumpdb') # or @route('/login', method='POST') 
def dumpdb_submit(): 
    global path,fulltabfile,sourceip,targetip,sourcedb,targetdb
    sourceip = request.forms.get('sourceip') 
    targetip = request.forms.get('targetip') 
    sourcedb = request.forms.get('sourcedb') 
    targetdb = request.forms.get('targetdb') 
    path = os.getcwd()
    fulltabfile = path + '/whitetables.txt'
    
    if(not os.path.isfile(fulltabfile)):
        return '-----> The Full List Is Non-Existent! <-----'
    elif (sourceip == '') or (targetip == '') or (sourcedb == '') or (targetdb == '') :
        return '<p>-----> Missing Parameter! <-----</p>'
    else:
        createdb()
        fulltable()
        ideatime()
        return "<p>DumpDB AD finish!<br><br></p><p><a href=\"/dbservice\">返回</a><br></p>" 
    
def createdb():   #create databases
    print 'Starting Create DB ...... '
    dbsqlfile = path + '/' + targetdb + '.sql'
    if (os.path.isfile(dbsqlfile)):
        os.remove(dbsqlfile)
    dumpdb = 'mysqldump -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd --skip-tz-utc -d ' + sourcedb + ' > ' + dbsqlfile
    os.popen(dumpdb)
    dropdb = 'mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd -e \"drop database if exists ' +  targetdb + '\"'
    os.popen(dropdb)
    createdb = 'mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd -e \"create database ' +  targetdb + '\"'
    os.popen(createdb)
    dbsql = 'mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd ' + targetdb + ' < ' + dbsqlfile
    os.popen(dbsql)
    if (os.path.isfile(dbsqlfile)):
        os.remove(dbsqlfile)
    print 'Create DB finish!'
    
def fulltable():   #full dump the effect white list
    print 'Start Import fulltable ...... '
    fullgzfile = path + '/fulltable.sql.gz'
    if (os.path.isfile(fullgzfile)):
        os.remove(fullgzfile)
    fulllists = fulllist()
    #print whitetables
    #tables = 'cast_os cast_time p_module'
    fulldump = 'mysqldump -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd --skip-tz-utc ' + sourcedb + ' ' + fulllists + '| gzip > ' + fullgzfile
    print fulldump
    os.popen(fulldump)
    fullsql = 'gunzip < ' + fullgzfile + ' | mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd ' +  targetdb
    #print fullsql
    os.popen(fullsql)
    if (os.path.isfile(fullgzfile)):
        os.remove(fullgzfile)
    print 'Import fulltable finish!'
    
def ideatime():   #update idea_time
    print 'Start Import idea_time ...... '
    ideatimegzfile = path + '/ideatime.sql.gz'
    if (os.path.isfile(ideatimegzfile)):
        os.remove(ideatimegzfile)    
    #ideatimecond = '''"startTime = '2013-07-24 18:00:00'"'''
    ideatimecond = '\"startTime >= \'' + date(0) + '\' and startTime < \'' + date(-8) + '\'\"'
    #print ideatimecond
    ideatimedump = 'mysqldump -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd --skip-tz-utc ' + sourcedb + ' idea_time --where ' + ideatimecond + '| gzip > ' + ideatimegzfile
    #print ideatimedump
    os.popen(ideatimedump)
    ideatimesql = 'gunzip < ' + ideatimegzfile + ' | mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd ' +  targetdb
    #print ideatimesql
    os.popen(ideatimesql)
    if (os.path.isfile(ideatimegzfile)):
        os.remove(ideatimegzfile) 
    print 'Import idea_time finish!'
        
def fulllist():   #get effect white list
    fulllist = ''
    fv = open(fulltabfile)
    re = fv.readline()
    fulltabfiles = re.strip('\n').rstrip().split(' ')
    print '--> fulltabfiles ...... '
    print fulltabfiles
    tbs = 'mysql -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd -N -e \"select table_name from information_schema.tables where table_schema = \'' +  sourcedb + '\'\"'
    tabs = os.popen(tbs)
    tables = tabs.read().replace('\n',' ').rstrip().split(' ')
    print '--> tables of sourcedb ......'
    print tables
    for tbfull in fulltabfiles:
        if (tbfull in tables):
            fulllist = fulllist + tbfull + ' '
    fulllist = fulllist.replace('idea_time ','')
    print "--> fulllist ...... "
    print fulllist
    return fulllist
        
def date(n):
    today=datetime.date.today()
    day=datetime.timedelta(days=n) 
    deltaday = (today - day).strftime('%Y-%m-%d %H:%M:%S' )
    #print deltaday
    return deltaday


#Update DB ----------------------------------------------------------------------------------------



@get('/updatedb') # or @route('/login') 
def updatedb_form(): 
    return '''<form method="POST"> 
                <p>更新AD测试数据<br></p>
                <p>源数据库：<br>
                sourceip:<input name="sourceip" type="text" /><br>
                sourcedb:<input name="sourcedb" type="text" /><br></p>
                <p>目标数据库：<br>
                targetip:<input name="targetip" type="text" /><br>
                targetdb:<input name="targetdb" type="text" /><br></p>
                <input type="submit" name="submit" value="submit" /><br>
                <p>注：执行过程大概需要5分钟。<br><br></p>
                <p><a href="/dbservice">返回</a><br></p>
              </form>''' 
 
@post('/updatedb') # or @route('/login', method='POST') 
def updatedb_submit(): 
    global path,whitefile,blackfile,sourceip,targetip,sourcedb,targetdb
    sourceip = request.forms.get('sourceip') 
    targetip = request.forms.get('targetip') 
    sourcedb = request.forms.get('sourcedb') 
    targetdb = request.forms.get('targetdb') 
    path = os.getcwd()
    whitefile = path + '/whitetables.txt'
    blackfile = path + '/blacktables.txt'
    
    if (not os.path.isfile(whitefile)):
        return '<p>-----> The White List Is Non-Existent! <-----</p>'
    elif (not os.path.isfile(blackfile)):
        return '<p>-----> The Black List Is Non-Existent! <-----</p>'
    elif (sourceip == '') or (targetip == '') or (sourcedb == '') or (targetdb == '') :
        return '<p>-----> Missing Parameter! <-----</p>'
    else:
        return update() + '<br><p><a href=\"/dbservice\">返回</a><br></p>'
        #return '<p>-----> DB Update Finish! <-----</p>'
    
def whitetab():   #read white list of effective tables
    #print whitefile
    fwhite = open(whitefile)
    fw = fwhite.readline()
    whitetab = fw.split(' ')
    fwhite.close()
    return whitetab

def uptab():   #get update list which tables had be changed  within 7 days
    uptabsql = 'mysql -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd -N -e \"select TABLE_NAME from information_schema.TABLES where information_schema.TABLES.TABLE_SCHEMA = \'' + sourcedb + '\' and UPDATE_TIME >= \'' + date(7) + '\'\"' 
    #print uptabsql
    up = os.popen(uptabsql)
    uptab = up.read().replace('\n',' ').rstrip().split(' ')
    print '---> Update Tables List  : ' + str(uptab) 
    return uptab

def blacktab():   #read black list of invalid tables
    fblack = open(blackfile)
    fb = fblack.readline()
    blacktab = fb.split(' ')
    fblack.close()
    return blacktab

def source(tb):   #get the columns of sourcedb
    sql = '\"select column_name from information_schema.columns where information_schema.columns.table_schema = \'' + sourcedb + '\' and information_schema.columns.table_name = \'' + tb + '\'\"'
    #print sql
    sourcesql = 'mysql -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd -N -e ' + sql
    #print sourcesql
    src = os.popen(sourcesql)
    source = src.read().replace('\n',' ').rstrip().split(' ')
    return source

def target(tb):   #get the columns of targetdb
    sql = '\"select column_name from information_schema.columns where information_schema.columns.table_schema = \'' + targetdb + '\' and information_schema.columns.table_name = \'' + tb + '\'\"'
    #print sql
    targetsql = 'mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd -N -e '  + sql
    #print targetsql
    tar = os.popen(targetsql)
    target = tar.read().replace('\n',' ').rstrip().split(' ')
    return target

def diff(tb):   #compare diff columns of the tables
    columns = ''
    sourcecolumns = source(tb)
    targetcolumns = target(tb)
    for column in sourcecolumns:
        if (column not in targetcolumns):
            columns = columns + column + ' '
    if (columns != ''):
        print '---> Table : [' + tb +'] Be Created Columns : [ ' + columns + ']'
    return columns

def uptable(table):   #update tables
    idea_time = ''
    uptabgzfile = path + '/uptable.sql.gz'
    if (os.path.isfile(uptabgzfile)):
        os.remove(uptabgzfile)
    if (table.count('idea_time ') > 0):
        idea_time = 'idea_time '
        table = table.replace('idea_time ','')
        ideatime()
    uptabdump = 'mysqldump -h' + sourceip + ' -uyouku -psdSD*ss2D_ctsd --skip-tz-utc ' + sourcedb + ' ' + table + '| gzip > ' + uptabgzfile
    print uptabdump
    os.popen(uptabdump)
    print '--> Update Tables Dump !!! '
    uptabsql = 'gunzip < ' + uptabgzfile + ' | mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd ' +  targetdb
    #print uptabsql
    print 'Update Tables Import !!!'
    os.popen(uptabsql)
    if (os.path.isfile(uptabgzfile)):
        os.remove(uptabgzfile)
    print '-----> update [ ' + targetdb + ' ].[ ' + table + idea_time + '] successful! <-----'
    return '-----> update [ ' + targetdb + ' ].[ ' + table + idea_time + '] successful! <----- <br> '
    
def update():   #update
    table = ''
    unknow = ''
    change = ''
    value = ''
    whitetablist = whitetab()
    uptablist = uptab()
    blacktablist = blacktab()
    #print whitetablist
    #print uptablist
    #print blacktablist
    if (uptablist[0] == '') or (uptablist[0] == ' '):
        value = '-----> No Tables Need To Be Updated! <----- <br> '
    else:
        print '-----> Filter Tables <-----'
        for tb in uptablist:
            if (tb in whitetablist):
                if (diff(tb) == '' ):
                    table = table + tb + ' '      #add table name to 'table' which table in white list and the columns had no changed
                else:
                    change = change + tb + ' '      #add table name to 'change' which table in white list and the columns had changed
            elif (tb not in whitetablist) and (tb not in blacktablist):
                unknow = unknow + tb + ' '   #add table name to 'unknow' which table not in white list and black list
        if (table == '') or (table == ' '):
            print '-----> No Effect Tables Need To Be Updated! <-----'
            value = value + '-----> No Effect Tables Need To Be Updated! <----- <br> '
        else:
            print '---> Effect Tables is : ', table
            value = value + '---> Effect Tables is : ' + table + ' <br> '
            print '-----> Start Update Tables <-----'
            value = value + uptable(table)   #do the update tables
        if (change == '') or (change == ' '):
            print '-----> No Columns of UpTables Had Be Changed! <-----'
            value = value + '-----> No Columns of UpTables Had Be Changed! <----- <br> '
        else:
            print '---> Warnning Change Tables is : ', change
            value = value + '---> Warnning Change Tables is : ' + change + ' <br> '
        if (unknow == '') or (unknow == ' '):
            print '-----> No Unknow Tables! <-----'
            value = value + '-----> No Unknow Tables! <----- <br> '
        else:
            print '---> Warnning Unknow Tables is : ', unknow
            value = value + '---> Warnning Unknow Tables is : ' + unknow + ' <br> '        
    return value

    
run(host='10.10.69.179', port='8090')


