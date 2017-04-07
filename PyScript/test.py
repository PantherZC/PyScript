#!/usr/bin/python2.6
import re,datetime
file_name='/home/alzhong/logs/qtat1/R2860.01.13/sim-applycommitrollback-bld1.log'
file=open(file_name,'r')
acnum=[];time_res=[];lnum=0
def trans_time(time):
    t1=datetime.datetime.strptime(time,'%y/%m/%d %H:%M:%S')
    return t1
for (num,line) in enumerate(file):

    if(re.search(r'^(.*)BEGINNING SIM PROCEDURE(.*)$',line)):
        m=re.search(r'^(.*)BEGINNING SIM PROCEDURE(.*)$',line)
        print 'Step %d:'%(lnum), m.group(0);lnum+=1
        acnum.append(trans_time(line[0:17]))
    elif(re.search(r'^(.*)CP_W(.*)$', line)):
        m=re.search(r'^(.*)CP_W(.*)$', line)
        print 'Step %d:'%(lnum), m.group(0);lnum+=1
        acnum.append(trans_time(line[0:17]))
    elif(re.search(r"^(.*)VERIFY_S(.*)$", line)):
        m=re.search(r"^(.*)VERIFY_S(.*)$", line)
        print 'Step %d:'%(lnum), m.group(0);lnum+=1
        acnum.append(trans_time(line[0:17]))
    elif(re.search(r"^(.*)--action commit(.*)$",line)):
        m=re.search(r"^(.*)--action commit(.*)$",line)
        print 'Step %d:'%(lnum), m.group(0);lnum+=1
        acnum.append(trans_time(line[0:17]))
    elif(re.search(r"^(.*)COMPLETED SIM PROCEDURE(.*)$",line)):
        m=re.search(r"^(.*)COMPLETED SIM PROCEDURE(.*)$",line)
        print 'Step %d:'%(lnum), m.group(0);lnum+=1
        acnum.append(trans_time(line[0:17]))
    elif(re.search(r"^(.*)RESUMING SIM PROCEDURE(.*)$",line)):
        m=re.search(r"^(.*)RESUMING SIM PROCEDURE(.*)$",line)
        print 'Step %d:'%(lnum), m.group(0);lnum+=1
        acnum.append(trans_time(line[0:17]))

file.close()
if(re.search(r"^(.*)backout(.*)$",file_name)):
    time_res.append((acnum[2]-acnum[0]).seconds/60)
    time_res.append((acnum[4]-acnum[3]).seconds/60)
    time_res.append((acnum[6]-acnum[5]).seconds/60)
    time_res.append(((acnum[8]-acnum[7])+(acnum[10]-acnum[9])+(acnum[13]-acnum[11])).seconds/60)
    print "\n3). sim --proc update --action apply to \"CP_WARNING\" %s mins" %(time_res[0])
    print "4). sim --proc update --action resume to  \"VERIFY_SOFTWARE\" %s mins"%(time_res[1])
    print "5). sim --proc update --action resume to  \"COMMIT\" %s mins"%(time_res[2])
    print "8). Backout from RXX to RXX  %s mins"%(time_res[3])
elif(re.search(r"^(.*)rollback(.*)$",file_name)):
    time_res.append((acnum[2]-acnum[0]).seconds/60)
    time_res.append((acnum[4]-acnum[3]).seconds/60)
    time_res.append((acnum[6]-acnum[5]).seconds/60)
    time_res.append((acnum[8]-acnum[7]).seconds/60)
    time_res.append(((acnum[10]-acnum[9])+(acnum[12]-acnum[11])+(acnum[15]-acnum[13])).seconds/60)
    print "\n3). sim --proc update --action apply to \"CP_WARNING\" %s mins" %(time_res[0])
    print "4). sim --proc update --action resume to  \"VERIFY_SOFTWARE\" %s mins"%(time_res[1])
    print "5). sim --proc update --action resume to  \"COMMIT\" %s mins"%(time_res[2])
    print "6). sim --proc update --action commit to end of Patch %s mins"%(time_res[3])
    print "8). Rollback from RXX to RXX %s mins" %(time_res[4])
if __name__ == '__main__':
    pass
