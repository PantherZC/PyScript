# -*- coding:utf-8 -*-
from matplotlib.dates import AutoDateLocator, DateFormatter,HourLocator,SecondLocator,datestr2num,MinuteLocator
import matplotlib.pyplot as plt 

def draw_pic(x,y,dt_str='%Y-%m-%d %H:%M:%S'):
    x = [datestr2num(item) for item in x]
    fig,ax = plt.subplots()
    autodates = AutoDateLocator()
    # secdates = SecondLocator()
    mindates = MinuteLocator()
    # hourdates = HourLocator()   
    yearsFmt = DateFormatter(dt_str)  
    fig.autofmt_xdate()    
    ax.xaxis.set_major_locator(autodates)     
    ax.xaxis.set_major_formatter(yearsFmt) 
    ax.plot(x,y,'b-')
    plt.show()  
 
if __name__ == '__main__':
    dt_str = '%H:%M:%S'
    # x = ['2014-12-31 10:09:00','2014-12-31 10:29:00','2014-12-31 10:49:00','2014-12-31 11:09:00','2014-12-31 11:29:00']
    # y = [0,1,2,3,4]
    log_file = open('t_log.txt')
    x = []
    y = []
    while True:
        line = log_file.readline()
        if not line:
            break
        log_info = line.split('\t')
        if len(log_info) >=3:
            x.append(log_info[0])
            y.append(log_info[1])
        else:
            print line
    draw_pic(x,y,dt_str)