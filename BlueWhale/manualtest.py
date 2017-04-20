﻿import jpype 
from jpype import JavaException 
import sys

def init(confpath):
	try: 
	  print "Begin Init Config: " 
	  #call the init function of StoreManager class 
	  StoreManager.initialize(confpath)
	  print "End Init Config" 
	except JavaException, ex: 
	  print "Init Config Exception: ", JavaException.message() 
	  print JavaException.stackTrace() 
	except: 
	  print "Init fail! - Unknown Error" 

def set(key,value):
	try: 
	  print "Begin Set: " 
	  #call the init function of StoreManager class 
	  print poolname
	  client = StoreManager.getStoreClient(poolname)
	  result = client.set(key,value)
	  code = result.getCode()
	  print "The code of set is : ", code
	  print "End Set" 
	  return code
	except JavaException, ex: 
	  print "Set Exception: ", JavaException.message() 
	  print JavaException.stackTrace() 
	except: 
	  print "Set fail! - Unknown Error" 
  
def get(key):
	try: 
	  print "Begin Get: "
	  print poolname
	  #call the init function of StoreManager class 
	  client = StoreManager.getStoreClient(poolname)
	  result = client.get(key)
	  code = result.getCode()
	  value = result.getRetObj()
	  print "The code of get is : ", code
	  print "The value of get is : ", value 
	  print "End Get" 
	  return code
	except JavaException, ex: 
	  print "Get Exception: ", JavaException.message() 
	  print JavaException.stackTrace() 
	except: 
	  print "Get fail! - Unknown Error" 
	  
def shutdown():
	jpype.shutdownJVM()        #shut down JVM 
	  

def delete(key):
	try: 
	  print "Begin Del: "
	  print poolname
	  #call the init function of StoreManager class 
	  client = StoreManager.getStoreClient(poolname)
	  result = client.delete(key)
	  code = result.getCode()
	  print "The code of del is : ", code
	  print "End Del" 
	except JavaException, ex: 
	  print "Del Exception: ", JavaException.message() 
	  print JavaException.stackTrace() 
	except: 
	  print "Del fail! - Unknown Error" 

 
if __name__=='__main__':
	if (len(sys.argv) == 4):
		jvmPath = jpype.getDefaultJVMPath()           #the path of jvm.dll 
		classpath = "/root/python/javalib/ad-redis-client-0.3.1-jar-with-dependencies.jar"   #the path of PasswordCipher.class 
		print classpath
		jvmArg = "-Djava.class.path=" + classpath 
		if not jpype.isJVMStarted():                    #test whether the JVM is started 
		  jpype.startJVM(jvmPath,jvmArg)             #start JVM 
		StoreManager = jpype.JClass("com.youku.ad.redis.config.StoreManager")   #create the Java class 
		poolname = "testserver"
		confpath = sys.argv[1]
		key = sys.argv[2]
		value = sys.argv[3]
		print confpath
		print key
		print value
		init(confpath)
		set(key,value)
		get(key)
		delete(key)
		get(key)
		#shutdown()
	else:
		print len(sys.argv)
		print "Missing required arguments!"
		print "test.py conf key value"
