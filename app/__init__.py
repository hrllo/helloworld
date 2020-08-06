# -*- conding:utf-8 -*-
from flask import Flask
from config import Config
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate
from flask_login import LoginManager

apprun = Flask(__name__)
apprun.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql+psycopg2://postgres:123456@localhost:5432/postgres'
apprun.config['SECRET_KEY'] = 'a9087FFJFF9nnvc2@#$%FSD'
apprun.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
dbDriver = SQLAlchemy(apprun)
migrate = Migrate(apprun,dbDriver)
login = LoginManager(apprun)
login.login_view = 'login'


from app import routes,models
