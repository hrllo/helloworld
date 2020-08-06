# -*- conding:utf-8 -*-
from app import apprun, dbDriver


if __name__ == "__main__":
    apprun.debug = True
    dbDriver.create_all()
    apprun.run(host='0.0.0.0', port=7000)