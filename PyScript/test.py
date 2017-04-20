#coding=utf-8
import os
class puke:
    def base_list(self,n=10):
        bl = []
        for i in range(1,n):
            bl.append(i)
        #print bl
        return bl

    def mid_list(self,bl,l=[]):
        ml = []
        for n in range(len(bl)):
            if n % 2 == 0:
                l.append(bl[n])
            else:
                ml.append(bl[n])
        #print l,ml
        if len(ml) >= 1:
            #print l
            self.mid_list(ml,l)

    def final_list(self):
        bl = self.base_list()
        print bl
        fl = []
        self.mid_list(bl,fl)
        print fl
        return fl

    def split_num(self,fl):
        num = []
        ln = len(fl)
        #print ln
        while ln > 0:
            if ln % 2 == 0:
                num.append(ln/2)
            else:
                num.append(ln/2 + ln%2)
            ln = ln/2
        return num


'''
a = puke()
fl = a.final_list()
num = a.split_num(fl)
print num

if len(num)>0:
    s = 0
    for i in num:
        e = s + i
        #print s,e
        ll = fl[s:e]
        print ll
        s = e
'''
file = './txt'
ow = 'b'
nw = 'x'
f = open(file,'w+')
lines = f.readlines()
for line in lines:
    print line
    if ow in line:
        line = line.replace(ow,nw)
        print 'r',line
    f.writeline(line+'\n')
print lines
#f.writelines(lines)
f.close()
