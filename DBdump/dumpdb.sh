#!/usr/bin/expect

set DATE [exec date +%y%m%d]
puts "$DATE"
spawn scp 10.10.72.11:/root/python/url.py ./
set timeout 300
expect "root@10.10.72.11's password:"
set timeout 300
send "adtest11\r"
set timeout 300
interact
