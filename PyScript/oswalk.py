#coding=utf-8

import os
for root, dirs, files in os.walk("/Users/LeoZC/LeoZC/GitSpace/PanterZC", topdown=False):
    print root,dirs,files
    '''
    for name in files:
        print(os.path.join(root, name))
    print '---'
    for name in dirs:
        print(os.path.join(root, name))
'''
