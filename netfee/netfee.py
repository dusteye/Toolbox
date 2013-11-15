#!/usr/bin/python3

import urllib.request
import urllib.parse
import http.cookiejar
import smtplib
import sys
import json

from email.mime.text import MIMEText
from email.header import Header

class Monitor:
    def __init__(self, configpath):
        self.configfile = configpath
        self.config = self.readConfig()
        
        self.mailserver     = self.config['mailfrom']['mailserver']
        self.serverport     = self.config['mailfrom']['serverport']
        self.fromaddress    = self.config['mailfrom']['address']
        self.frompasswd     = self.config['mailfrom']['password']
        self.toaddress      = self.config['mailto']
        
        self.accounts = [(account['ip'], account['password']) for account in self.config['accounts']]
        self.warning = False
                
    def readConfig(self):
        config = {}
        try:
            with open(self.configfile) as f:
                config = json.load(f)
        except IOError:
            print("file \'%s\' doesn't exists" % configfile, file=sys.stderr)
            sys.exit()
        except ValueError as err:
            print("Illegal json format \'%s\'" % err, file=sys.stderr)
            sys.exit()
        return config
    
    def genMail(self):
        context = ''
        for (ip, passwd) in self.accounts:
            balance = checkAccount(ip, passwd)
            context += ip + ": " + balance + '\n'
            if float(balance) < 1.0:
                self.warning = True
        context += '\n'
        self.msg = MIMEText(context.encode('utf-8'), 'plain', 'utf-8')
        sub = Header('服务器余额', 'utf-8')
        self.msg['Subject'] = sub
        self.msg['From'] = self.fromaddress
        self.msg['To'] = self.toaddress

    def sendMail(self):
        server = smtplib.SMTP(self.mailserver, self.serverport)
        server.ehlo()
        server.starttls()
        server.ehlo()
        server.login(self.fromaddress, self.frompasswd)
        server.sendmail(self.fromaddress, self.toaddress, self.msg.as_string())
        server.close()
    
    def run(self):
        self.genMail()
        if self.warning:
            self.sendMail()

def autoLogin(url, params, req_encoding):
    cookiejar = http.cookiejar.CookieJar()
    opener = urllib.request.build_opener(urllib.request.HTTPCookieProcessor(cookiejar))
    urllib.request.install_opener(opener)

    params = urllib.parse.urlencode(params)
    params = params.encode(req_encoding)
    response = urllib.request.urlopen(url, params)

    return response

def checkAccount(ip, passwd): 
    params = {"fr":"00", "id_ip":ip, "pass":passwd, "set":"进入"}
    req_encoding = 'gb2312'
    res_encoding = 'utf-8'
    
    response = autoLogin('http://hitsun.hit.edu.cn/index1.php', params, req_encoding)
    text = response.read()

    text_decode = text.decode(req_encoding)
    text = text_decode.encode(res_encoding)

    text = str(text, 'utf-8')
    search_text = '所剩余额'
        
    for line in text.splitlines():
        if line.find(search_text)!=-1:
            return(line.split(';')[2].split(' ')[0])


if __name__ == '__main__':
    monitor = Monitor('config.json')
    monitor.run()
