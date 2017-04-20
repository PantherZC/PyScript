import jpype 
from jpype import JavaException 
#import time
import sys

def getvalue(key):
    jvmPath = jpype.getDefaultJVMPath()           #the path of jvm.dll 
    classpath = "./ad-redis-client.jar"                 #the path of PasswordCipher.class /Linux
#classpath = "D:\\eclipse\workspace\\cookietest\\javalib\\ad-redis-client.jar"                 #the path of PasswordCipher.class /Windows
    #print classpath
    jvmArg = "-Djava.class.path=" + classpath 
    if not jpype.isJVMStarted():                    #test whether the JVM is started 
        jpype.startJVM(jvmPath,jvmArg)             #start JVM 
    StoreManager = jpype.JClass("com.youku.ad.redis.config.StoreManager")   #create the Java class 
    confpath = "./zookeeper.properties"     #zookeeper conf dir /Linux
#confpath = "D:\\179\\zookeeper.properties"     #zookeeper conf dir /Windows
    poolname = "adtestserver"
#poolname = "onlinecookieserver"
    value = ""
    #init
    try: 
        #print "Begin Init Config: " 
        #call the init function of StoreManager class 
        StoreManager.initialize(confpath)
        #print "Init Config Finish!" 
    except JavaException, ex: 
        print "Init Config Exception: ", JavaException.message(), ex.message() 
        print JavaException.stacktrace(), ex.message() 
    except: 
        print "Init failed! - Unknown Error"     
    
    #get
    try: 
        #print "Begin Get: "
        #print poolname
        #call the init function of StoreManager class 
        client = StoreManager.getStoreClient(poolname)
        result = client.get(key)
        code = result.getCode()
        value = result.getRetObj()
        print "The code of get is : ", code
        print "The value of get is : ", value 
        #time.sleep(1)
        #print "End Get" 
    except JavaException, ex: 
        print "Get Exception: ", JavaException.message(), ex.message()
        print JavaException.stacktrace(), ex.message()
    except: 
        print "Get failed! - Unknown Error"     
    
    return value
    
def shutdown():
    jpype.shutdownJVM()        #shut down JVM 

if __name__=='__main__':
    key = sys.argv[1]
#key = 'keycookietest'
    getvalue(key)
    #shutdown()
