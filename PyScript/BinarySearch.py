
#coding=utf-8

def BinarySearch(data,target,id=0):
    # 中间值的索引号的定义：数组长度/2
    mid = len(data)/2
    #left = 0
    #right = len(data)
    #mid等于0就是找到最后一个元素了。
    if mid != 0:
        # 如果我们要找的值（target）比中间值（data[mid]）小
        if data[mid] > target:
            print("你要找的数字比中间值[%s]小..." % data[mid])
            # 在中间值（data[mid]）的左侧继续查找，在此函数中继续循环
            print mid
            #id = mid
            print 'id:',id
            BinarySearch(data[:mid],target,id)
        # 如果我们要找的值（target）比中间值（data[mid]）大
        elif data[mid] < target:
            print("你要找的数字比中间值[%s]大..." % data[mid])
            # 在中间值（data[mid]）的右侧继续查找，在此函数中继续循环
            id += mid
            print 'id:',id
            BinarySearch(data[mid:],target,id)
        else:
            # 如果我们要找的值（target）既不比中间值（data[mid]）大，也不比中间值（data[mid]）小，则就是它
            print("这就是你要找的[%s]-位置[%s]！" % (data[mid],id))
    else:
        print("不好意思，没有找到你要的值...")


def binary_search(l,key,lo=0,hi=None):
    if not hi:
        hi = len(l)
    while lo<hi:
        mid = (lo+hi)//2
        if l[mid]>key:
            hi = mid
        elif l[mid]<key:
            lo = mid
        else:
            return mid
    return -1


if __name__ == '__main__':
    # 创建一个1到6000万的连续数字数组
    data = list(range(600))
    # 调用函数找到95938的值
    #BinarySearch(data,538)
    print binary_search(data,538)
