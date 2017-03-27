import os
path = os.getcwd()
file = path + '/abc.txt'
f = open(file,'a+')
print f.tell()
f.seek(0,0)
print f.tell()
f.write('abc\n')
f.close()
