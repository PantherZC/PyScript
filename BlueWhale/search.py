from bottle import route, request, response, run
import getcookie
@route('/search')
def search():
    key = request.GET.get('key')
    res = getcookie.getvalue(key)
#return 'The Vaule of %s is : %s ' % (key)
    return {'value':res,'key':key}
run(host='10.10.69.179', port='8080')
