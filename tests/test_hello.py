import subprocess
import sys
import os
import unittest
import time
import tempfile
import shutil

from webtest import TestApp
from nginxtest.server import NginxServer
import requests
from support import TestMyNginx


class TestHello(TestMyNginx):

    def setUp(self):
        super(TestHello, self).setUp()
        self.start_server()
        self.app = TestApp(self.nginx.root_url)

    def tearDown(self):
        self.stop_server()
        super(TestSpecReader, self).tearDown()

    def test_routing(self):
        res = self.app.get('/', headers={'User-Agent': 'Me'},
                           status=200)
        self.assertEqual(res.body, 'yeah')
