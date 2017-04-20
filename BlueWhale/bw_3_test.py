# -*- coding:utf-8 -*- 
import jpype
from jpype import JavaException
import redis
import random
import string
from rediscluster import RedisCluster
import schedule
import time
import datetime
from timeit import Timer

# define the params
host = '10.100.14.104'
port = '8001'
status_o = 'OK'
status_n = 'DATANOTEXSITS'
status_f = 'CONN_FAILED'
status_u = 'UNUSEABLE'
status_i = 'INVALIDARG'
value_n = 'None'

def create_str(length=8):
    result = string.join(random.sample('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890',length)).replace(' ','')
    return result
def create_key(host,port):
    startup_nodes = [{"host": host, "port": port}]
    try:
        rc = RedisCluster(startup_nodes=startup_nodes, decode_responses=True)
    except Exception, e:
        print e
    key = 'HH' + create_str()
    while rc.exists(key):
        # print key
        key = 'HH' + create_str()
    return (key,key[2:]+'_v')
def create_key_f(host,port,num=30):
    startup_nodes = [{"host": host, "port": port}]
    try:
        rc = RedisCluster(startup_nodes=startup_nodes, decode_responses=True)
    except Exception, e:
        print e
    key = 'HH' + create_str()
    key_file = open('key_file.txt','w') 
    for i in xrange(num):
        while rc.exists(key):
            # print key
            key = 'HH' + create_str()
            line = key + '\t' + key[2:] + '_v'
            key_file.writelines(line)
    key_file.close()
def start_jvm (jvmArg):
    """
    jvmArg:"-Xint"  "-Djava.class.path" "-DyourProperty=yourValue"
    """
    jvmPath = jpype.getDefaultJVMPath()
    if not jpype.isJVMStarted():
        if len(jvmArg) != 0:
            try:
                jpype.startJVM(jvmPath,jvmArg)
            except JavaException, ex:
                print ex.javaClass(), ex.message()
                print ex.stacktrace() 
        else:
            try:
                jpype.startJVM(jvmArg)
            except JavaException, ex:
                print '------',ex.javaClass(), ex.message()
                print '----',ex.stacktrace()            
    else:
        print 'jvm is running...'
def get_class(class_str='com.youku.ad.redis.config.StoreManager'):
    StoreManager = jpype.JClass(class_str)
    return StoreManager 
def pro_init(zk_config='zookeeper.properties'):
    try: 
        print "Init Config Begin ... " 
        #call the init function of StoreManager class 
        StoreManager.initialize(zk_config)
        print "Init Config Finish ..." 
    except JavaException, ex:
        print ex.javaClass(), ex.message()
        print ex.stacktrace() 
    except Exception,e: 
        print e,"Init fail! - Unknown Error" 
def get_client(servicename='test'):
    client = StoreManager.getStoreClient(servicename)
    return client
def create_client():
    global StoreManager,client
    StoreManager = get_class()
    pro_init()
    client = get_client()
    return client
def shutd_jvm():
    jpype.shutdownJVM()
def c_pro_set(key,value,status,expiretime=''):
    try: 
        print "Set Begin ... " 
        #print servicename #zookeeper.properties - store.service.names
        #call the getStoreClient function of StoreManager class 
        #client = StoreManager.getStoreClient(servicename)
        if (expiretime != ''):
            #result = client.set(key,value,expireTime)
            result = client.set(key,value,expiretime)
        else:
            result = client.set(key,value)
        code = result.getCode()
        print 'ResultCode:%s Status:%s'%(code,status)
        assert str(code) == str(status)
    except JavaException, ex:
        print ex.javaClass(), ex.message()
        print ex.stacktrace() 
    except AssertionError,reason: 
        print '*'*50
        print "Set fail!Assertion Error,%s" %reason
        print '*'*50 
def c_pro_set1(host=host,port=port,status=status_o,expiretime=''):
    k_v = create_key(host,port)
    key = k_v[0][2:]
    value = k_v[1]
    start = time.time()
    c_pro_set(key,value,status,expiretime)
    c_pro_get(key,value,status) 
def c_pro_get(key,t_value,status):
    try: 
        print "Get Begin ...  "
        #print servicename #zookeeper.properties - store.service.names
        #call the getStoreClient function of StoreManager class 
        #client = StoreManager.getStoreClient(servicename)
        result = client.get(key)
        code = result.getCode()
        value = result.getRetObj()
        print 'ResultCode:%s Status:%s'%(code,status)
        print 'ResultValue:%s Value:%s'%(value,t_value)
        assert str(code) == str(status)
        assert str(value) == str(t_value)
    except JavaException, ex:
        print ex.javaClass(), ex.message()
        print ex.stacktrace() 
    except AssertionError,reason:
        print '*'*50 
        print "Get fail!Assertion Error!%s" %reason 
        print '*'*50
def c_pro_get1(host=host,port=port,status=status_o,key='*'):
    keys = c_keys(host,port,key)
    if len(keys) > 0:
        key_num = random.randint(0,len(keys)-1)
        try: 
            print "Get Begin ...  "
            #print servicename #zookeeper.properties - store.service.names
            #call the getStoreClient function of StoreManager class 
            #client = StoreManager.getStoreClient(servicename)
            result = client.get(keys[key_num][2:])
            code = result.getCode()
            value = result.getRetObj()
            print 'ResultCode:%s Status:%s'%(code,status)
            print 'Key:%s ResultValue:%s'%(keys[key_num],value)
            assert str(code) == str(status)
        except JavaException, ex:
            print ex.javaClass(), ex.message()
            print ex.stacktrace() 
        except AssertionError,reason:
            print '*'*50 
            print "Get fail!Assertion Error!%s" %reason 
            print '*'*50
    else:
        print '-'*50 
        print "no keys in db"
        print '-'*50 
def c_pro_get2(status,keys):
    key_num = random.randint(0,len(keys)-1)
    try: 
        # print "Get Begin ...  "
        result = client.get(keys[key_num][2:])
        code = result.getCode()
        value = result.getRetObj()
        # print 'ResultCode:%s Status:%s'%(code,status)
        # print 'Key:%s ResultValue:%s'%(keys[key_num],value)
        check_result(code,status)
        return code
    except JavaException, ex:
        print ex.javaClass(), ex.message()
        print ex.stacktrace() 
    # except AssertionError,reason:
    #     print '*'*50 
    #     print "Get fail!Assertion Error!%s" %reason 
    #     print '*'*50   
def c_pro_del(key,status):
    try: 
        print "Del Begin ..." 
        result = client.delete(key)
        code = result.getCode()
        print 'ResultCode:%s Status:%s'%(code,status)
        assert str(code) == str(status)
    except JavaException, ex:
        print ex.javaClass(), ex.message()
        print ex.stacktrace() 
    except AssertionError,reason:
        print '*'*50 
        print "Get fail!Assertion Error,%s" %reason
        print '*'*50  
def r_get_set(ip,port,DBIndex,r_type,key,value,expiretime=''):
    r = redis.StrictRedis(host=ip, port=port, password='',db=DBIndex)
    data = ''
    if r_type == 'get':
        if r.exists(key):
            data = r.get(key)          
        return data
    else:
        r.set(key,value)
        if expiretime != '':
            r.expire(key,expiretime)
def c_get_set(host,port,r_type,key,value,expiretime=''):
    # startup_nodes = [{"host": "10.10.72.11", "port": "6379"},{"host": "10.10.72.11", "port": "6380"},{"host": "10.10.72.11", "port": "6381"}]
    startup_nodes = [{"host": host, "port": port}]
    data = ''
    try:
        rc = RedisCluster(startup_nodes=startup_nodes, decode_responses=True)
    except Exception, e:
        print e
    if r_type == 'get':
        if rc.exists(key):
            data = rc.get(key)          
        return data
    else:
        print rc.set(key,value)
        if expiretime != '':
            rc.expire(key,expiretime)
def c_keys(host,port,key='*'):
    startup_nodes = [{"host": host, "port": port}]
    try:
        rc = RedisCluster(startup_nodes=startup_nodes, decode_responses=True)
    except Exception, e:
        print e
    return rc.keys(key)
def get_key_node(host,port,key):
    startup_nodes = [{"host": host, "port": port}]
    data = ''
    try:
        rc = RedisCluster(startup_nodes=startup_nodes, decode_responses=True)
    except Exception, e:
        print e
    slot = rc.keyslot(key)
    return rc.slots[slot]['name']
def get_slave_node(nodes,m_node):
    s_nodes = []
    # print m_node
    for node in nodes:
        # print node
        if m_node in node:
            for item in node:
                if item != m_node:
                    s_nodes.append(item)
    return s_nodes
def check_result(v1,v2):
    try:
        print 'Result:%s Value:%s' %(v1,v2)
        assert str(v1) == str(v2)
    except AssertionError, e:
        print '*'*50
        print 'AssertionError!%s' %e
        print '*'*50

if __name__ == '__main__':
    # print create_str()    
    # set or get through the rediscluster
    key = create_str()
    value = key + '_v'
    print 'key:%s value:%s' %(key,value)
    # host = '10.10.72.11'
    # port = '6379'
    # nodes = (('10.10.72.11:6379','10.10.72.11:6382'),('10.10.72.11:6380','10.10.72.11:6383'),('10.10.72.11:6381','10.10.72.11:6384'))
    host = '10.100.14.104'
    port = '8001'
    nodes = (('10.100.14.104:8001','10.100.14.105:8005'),('10.100.14.104:8002','10.100.14.105:8006'),('10.100.14.105:8004','10.100.14.104:8003'))
    s_type = 'set'
    g_type = 'get'
    # c_get_set(host,port,s_type,key,value)
    # print c_get_set(host,port,g_type,key,value)
    # r_get_set(host,port,0,s_type,key,value)
    # print r_get_set(host,port,0,g_type,key,value)
    # key_m = get_key_node(host,port,key)
    # print key_m
    # key_s = get_slave_node(nodes,key_m)
    # print key_s
    # print c_keys(host,port)

    ####----------#####
    ## initial env: java jar 
    classpath = 'D:\\python\\bh\\ad-redis-client-3.0.2.jar'#the path of API jar
    jvmArg = "-Djava.class.path=" + classpath
    start_jvm(jvmArg)
    """ the flow of creating client 
    # StoreManager = jpype.JClass('com.youku.ad.redis.config.StoreManager')
    # zk_config = 'zookeeper.properties'
    # pro_init(zk_config)
    # servicename = 'test'
    # client = StoreManager.getStoreClient(servicename)
    """
    client = create_client()
    status_o = 'OK'
    status_n = 'DATANOTEXSITS'
    status_f = 'CONN_FAILED'
    status_u = 'UNUSEABLE'
    status_i = 'INVALIDARG'
    value_n = 'None'
    # ###redis env:normal operation:set|get|del####
    # for i in xrange(3):## cover all nodes
    #     k_v = create_key(host,port) ##create a key doesn't exist
    #     key = k_v[0][2:]
    #     value = k_v[1]
    #     m_node = get_key_node(host,port,key)
    #     print 'key:%s value:%s' %(key,value)
    #     print 'the slot in master node:%s' % m_node 
    #     c_pro_get(key,value_n,status_n) ##get a key doesn't exist
    #     c_pro_del(key,status_n) ##del a key doesn't exist
    #     c_pro_set(key,value,status_o) ##set a new key 
    #     c_pro_get(key,value,status_o) ##get a key exists
    #     c_pro_set(key,value+'_n',status_o) ##update a key exist
    #     c_pro_get(key,value+'_n',status_o) ##check update
    #     c_pro_del(key,status_o) ##delete a key exist
    #     c_pro_get(key,value_n,status_n) ##check del

    ###redis env:master or slave down operation:set|get|del####
    # for i in xrange(10):## cover all nodes
        # k_v = create_key(host,port) ##create a key doesn't exist
        # key = k_v[0][2:]
        # value = k_v[1]
        # m_node = get_key_node(key)
        # print 'key:%s value:%s' %(key,value)
        # print 'the slot in master node:%s' % m_node
        # c_pro_get(key,value_n,status_n) ##get a key doesn't exist
        # c_pro_del(key,status_n) ##del a key doesn't exist
        # c_pro_set(key,value,status_o) ##set a new key 
        # c_pro_get(key,value,status_o) ##get a key exists
        # c_pro_set(key,value+'_n',status_o) ##update a key exist
        # c_pro_get(key,value+'_n',status_o) ##check update    
        # c_pro_del(key,status_o) ##delete a key exist
        # c_pro_get(key,value_n,status_n) ##check del
    # ###the down node is up or add | del node
    ### make sure the keys cover all nodes
    # create_key_f(host,port)
    # ## set or del the keys in key_info
    # key_f = open('key_file.txt')
    # while True:
    #     line = key_f.readline()
    #     if not line:
    #         break
    #     key_info = line.split('\t')
    #     key_m = get_key_node(host,port,key_info[0])
    #     key_s = get_slave_node(nodes,key_m)
    #     print 'key:%s value:%s' %(key,value)
    #     print 'the slot in master node:%s slave nodes:%s' % (m_node,str(key_s))
    #     c_pro_set(key1,key_info[key1],status_o) ##set a key
    #     c_pro_del(key1,status_o) ##delete a key exist
    # ## after set the key,recover the fail node ,check later
    # while True:
    #     line = key_f.readline()
    #     if not line:
    #         break
    #     key_info = line.split('\t')
    #     key_m1 = get_key_node(host,port,key_info[0])
    #     key_s1 = get_slave_node(nodes,key_m1)
    #     if len(key_s1) == 0:
    #         print '*'*50
    #         print 'the num of slave nodes is %d' % len(key_s)
    #         print '*'
    #     else:        
    #         for s_n in key_s1:
    #             s_info = s_n.split(':')
    #             ## after set the key,recover the fail node and check later
    #             value_s = r_get_set(s_info[0],s_info[1],0,'get',key_info[0],key_info[1])
    #             check_result(value_s,value)
    #             ## after del the key,recover the fail node and check later
    #             value_s = r_get_set(s_info[0],s_info[1],0,'get',key_info[0],key_info[1])
    #             check_result(value_s,value_n) 

    ###redis env:normal operation:set|get|del key: null "" " "
    # key = None
    # c_pro_get(key,value_n,status_i)
    # key = ""
    # c_pro_del(key,status_i)
    # key = "  "
    # c_pro_set(key,value,status_i)

    ###redis env:normal operation:set key with expire 
    # key = create_str()
    # value = key + '_v'
    # print 'key:%s value:%s' %(key,value)
    # c_pro_set(key,value,status_o,30)
    # time.sleep(35)
    # c_pro_get(key,value_n,status_n)

    ###redis env:time out operation:set|get|del####
    # for i in xrange(10):## cover all nodes
        # key = create_str() 
        # value = key + '_v'
        # c_pro_get(key,value_n,status_f) 
        # c_pro_del(key,status_f) 
        # c_pro_set(key,value,status_f)  

    ###redis env:all nodes down operation:set|get|del####
    # for i in xrange(10):## cover all nodes
        # key = create_str() 
        # value = key + '_v'
        # c_pro_get(key,value_n,status_u) 
        # c_pro_del(key,status_u) 
        # c_pro_set(key,value,status_u)

    ### schedule the job of set|get ###
    keys = c_keys(host,port)
    # schedule.every(0.2).seconds.do(c_pro_set1,host,port,status_o)
    # schedule.every(0.2).seconds.do(c_pro_get2,host,port,status_o,keys)
    # while True:
    #     # print 'now time:',time.strftime('%Y-%m-%d %H:%M:%S')
    #     schedule.run_pending()
    #     # time.sleep(1)

    ### print the time of every operation
    t_log = open('t_log.txt','w')
    while True:
        start = time.clock()
        r_code = c_pro_get2(status_o,keys)         
        elapsed = time.clock()-start
        t_log.writelines(str(datetime.datetime.now()).split('.')[0] + '\t' + str(elapsed) + '\t' + str(r_code) + '\n')
        # print elapsed
    t_log.close()
    ###shutdown jvm###
    shutd_jvm()