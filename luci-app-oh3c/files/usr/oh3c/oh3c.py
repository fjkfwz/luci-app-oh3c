#!/usr/bin/python
# -*- coding:utf-8 -*-
""" Main program for oh3c.

"""

__version__ = '0.2'

import os, sys
import ConfigParser
from socket import *

import eapauth
import macmgr
def main():
    login_info = sys.argv[1:]
    # change mac address for binding mac user
    macaddr = login_info[3]
    if macaddr != 'default':
        line_of_mac = macmgr.get_line_of_mac("'wan'")
        if macaddr not in line_of_mac:
            macmgr.change_mac("'wan'",macaddr)
            macmgr.apply_mac()
    # TODO: delete the following line
    login_info_new = login_info[0:3]
    oh3c = eapauth.EAPAuth(login_info_new)
    oh3c.serve_forever()


if __name__ == "__main__":
    main()
