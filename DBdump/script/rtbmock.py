#encoding:utf-8
from bottle import get, post, route, request, run
import os
import datetime

#Index Page  ---------------------------------------------------------------------------------------------------------------------

@route('/bx')
def bx(name = 'World'):
    
    value = request.url_args[0]
    
    return value
    	  
run(host='10.10.69.179', port='9003')
