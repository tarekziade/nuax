import sys
import os
import unittest
import time
import tempfile
import shutil
import subprocess

from webtest import TestApp
from nginxtest.server import NginxServer
import requests


PY3 = sys.version_info.major == 3

LIBDIR = os.path.normpath(os.path.join(os.path.dirname(__file__),
                          '..', 'lib'))

HTTP_OPTIONS = """\
  lua_package_path "%s/?.lua;;";
"""  % LIBDIR


SERVER_OPTIONS = ""


LOCATION = """
  access_by_lua_file '%s/app.lua';
"""  % LIBDIR



class TestMyNginx(unittest.TestCase):

    def start_server(self):
        try:
            self.nginx = NginxServer(locations=[{'path': '/',
                                                 'definition': LOCATION}],
                                     http_options=HTTP_OPTIONS,
                                     server_options=SERVER_OPTIONS)
            self.nginx.start()
        except Exception:
            raise

    def stop_server(self):
        self.nginx.stop()
