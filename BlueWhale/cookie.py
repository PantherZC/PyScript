import sys
import os

def getvalue(key):
    cmd = "/opt/redis/bin/redis-cli -p 7380 -a adtestredis get "
    getcmd = cmd + key
    print getcmd	      
    exc = os.popen(getcmd)
    re = exc.read()
    res = re.strip('\n')
    print res
    return res

def delvalue(key):
    cmd = "/opt/redis/bin/redis-cli -p 7380 -a adtestredis del "
    getcmd = cmd + key
    exc = os.popen(getcmd)
    res = exc.read()
    print res
    return res    
    

if __name__=='__main__':
    #key = sys.argv[1]
    key = 'key001'
    getvalue(key)
#delvalue(key)
