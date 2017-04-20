from bottle import route, request, response, run
import cookie

@route('/search')
def search():
    key = request.GET.get('key')
    res = cookie.getvalue(key)
    return {'value':res,'key':key}

@route('/delete')
def delete():
    key = request.GET.get('key')
    res = cookie.delvalue(key)
    return "res = ",res

@route('/binary')
def binary():
    num = request.GET.get('num')
    return str(int(num,2))

run(host='10.10.69.179', port='8080')
