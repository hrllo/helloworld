#-*- coding:utf-8 -*-
import sys
reload(sys)
sys.setdefaultencoding('utf8')
from flask import render_template,flash,redirect,url_for
from app import apprun
from app.forms import LoginForm
import psycopg2
from flask_login import current_user, login_user
from app.models import User
from flask_login import logout_user
from flask import request
from werkzeug.urls import url_parse
from app import dbDriver
from models import User
from app.forms import RegistrationForm
from flask_sqlalchemy import SQLAlchemy
from models import Indexes


@apprun.route('/',methods=['GET','POST'])
def index():
    m=[]
    global message_get
    message_get = ''
    # message_get = request.get_data('id')
    conn = psycopg2.connect(database="postgres", user="postgres", password="123456", host="127.0.0.1", port="5432")
    tables=["tv","mail","shop","bank","music","news"]
    for TableName in tables:
        u = list()
        cur = conn.cursor()
        cur.execute('''select * from {0} order by NUMBER desc'''.format(TableName))
        u = list(cur.fetchall())
        m.append(u)
        if request.method == 'POST':
            id = request.form.get('id')
            ind = Indexes.query.filter( Indexes.types==TableName,Indexes.id==id)
            ind[0].number += 1
            dbDriver.session.commit()

            #
            # ind.number
            # cur.execute('''update {0} set number = number+1 where ind.id ='{1}';'''.format(TableName, id))
            # users = login.query.filter(id=me).first()
    conn.commit()
    return render_template('index.html',m=m)

@apprun.route('/register/',methods=['GET','POST'])
def register():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        password2 = request.form.get('password2')
        guest_ip = request.headers.environ['REMOTE_ADDR']

        if not all([username,password,password2]):
            flash ('参数不完整')
        elif password != password2:
            flash ('两次密码不一致，请重新输入')
        else:
            new_user = User(username=username,password_hash=password, guest_ip=guest_ip)
            dbDriver.session.add(new_user)
            dbDriver.session.commit()
            return redirect('/')
    return render_template('register.html')

## 登录
@apprun.route('/login/',methods=['GET','POST'])
def login():
    if request.method == 'POST':
        username = request.form.get('username')
        password = request.form.get('password')
        if not all([username,password]):
            flash ('参数不完整')
        users = User.query.filter(User.username==username and User.password_hash==password).first()
        # print(users.username)
        # print(users.password)
        #users = True
        if users:
            #request.method['session'] = username
            return redirect('/')
        else:
            return "login fail"
    if request.method == 'GET':
        return render_template('login.html')
    return 'method is valiad!'


