import os

def fulllist():   #get effect white list
    fulllist = ''
    fv = open(fulltabfile)
    re = fv.readline()
    fulltabfiles = re.strip('\n').rstrip().split(' ')
    print fulltabfiles
    tbs = 'mysql -h' + targetip + ' -uyouku -psdSD*ss2D_ctsd -N -e \"select table_name from information_schema.tables where table_schema = \'' +  targetdb + '\'\"'
    tabs = os.popen(tbs)
    tables = tabs.read().replace('\n',' ').rstrip().split(' ')
    print tabs
    for tbfull in fulltabfiles:
        if (tbfull in tables):
            fulllist = fulllist + tbfull + ' '
    fulllist = fulllist.replace('idea_time ','')
    print fulllist
    return fulllist
	
if __name__=='__main__':
    fulltabfile = './whitetables.txt'
    targetip = '10.10.69.179'
    targetdb = 'ad'
    fulllist()
