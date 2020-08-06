#-*- coding:utf-8 -*-
from app import dbDriver
from werkzeug.security import generate_password_hash, check_password_hash
from flask_login import UserMixin
from app import login


# class User(UserMixin,dbDriver.Model):
class User(dbDriver.Model):
    __tablename__ = 'user'
    id = dbDriver.Column('user_id', dbDriver.Integer,primary_key=True)
    username = dbDriver.Column(dbDriver.String(64),index=True,unique=True,)
    password_hash = dbDriver.Column(dbDriver.String(128))
    ip = dbDriver.Column('guest_ip',dbDriver.String(64))

    @login.user_loader
    def load_user(id):
        return User.query.get(int(id))

    def __init__(self, username, password_hash, guest_ip):
        self.password_hash = password_hash
        self.username = username
        self.ip = guest_ip

class Indexes(dbDriver.Model):
    __tablename__ = 'indexes'
    id = dbDriver.Column('indexes_id', dbDriver.Integer, primary_key=True)
    name = dbDriver.Column(dbDriver.String(64), index=True, unique=True, )
    link = dbDriver.Column(dbDriver.String(128))
    number = dbDriver.Column(dbDriver.String(64))
    types = dbDriver.Column(dbDriver.String(32))

    def __init__(self, name, link, number, types):
        self.name = name
        self.link = link
        self.types = types
        self.number = number



