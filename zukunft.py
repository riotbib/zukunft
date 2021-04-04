#! /usr/bin/env python

from bottle import Bottle, run, template, static_file, request, post, redirect, TEMPLATE_PATH
import argparse
import json
from datetime import datetime
from random import randrange
import hashlib
import os

abs_app_dir_path = os.path.dirname(os.path.realpath(__file__))
abs_views_path = os.path.join(abs_app_dir_path, 'views')
TEMPLATE_PATH.insert(0, abs_views_path )

app = Bottle()

parse_arguments = argparse.ArgumentParser(description='zukunft')
parse_arguments.add_argument('-p', '--path', required=True)
parse_arguments.add_argument('-t', '--token', required=True)
arguments = parse_arguments.parse_args()

@app.route('/datenverarbeitung')
def reroute():
    redirect("/")

@app.route('/datenverarbeitung', method='POST')
def submit():
    if request.query.token == arguments.token:
        with open(arguments.path + '/data/' + str(datetime.timestamp(datetime.now())) + '-' + hashlib.md5(str(randrange(0, 1312)).encode('UTF-8')).hexdigest() + '.txt', 'w') as file:
            payload = 'name: ' + request.forms.name + '\nactive: ' + request.forms.active + \
                  '\nmembership: ' + request.forms.membership + '\ninterests: '+ \
                  request.forms.interests + '\npositive: ' + request.forms.positive + \
                  '\nnegative: ' + request.forms.negative
        
            file.write(str(payload))
        return template('thanks')
    else:
        redirect("/")

@app.route('/', method='GET')
def check():
    if request.query.token == arguments.token:
        token = request.query.token
        return template('survey', token=token)
    else:
        return template('start')

@app.route('/static/<filename>')
def static(filename):
    return static_file(filename, root=arguments.path + '/resources/')


run(app, host='localhost', port=8161)
