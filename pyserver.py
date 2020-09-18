import socketserver
from bottle import route, run, template
import os


@route('/')
def index():
    path = "C:\Hackathon\PyWebserver\TestLogFolder"
    test = make_tree(path)
    return template('Home.tpl', tree=test)


def make_tree(path):
    tree = dict(name=os.path.basename(path), children=[])
    try:
        lst = os.listdir(path)
    except OSError:
        pass  # ignore errors
    else:
        for name in lst:
            fn = os.path.join(path, name)
            if os.path.isdir(fn):
                tree['children'].append(make_tree(fn))
            else:
                tree['children'].append(dict(name=name))
    return tree


@route('/fileClicked', method='GET')
def fileClicked():
    return "File"


@route('/folderClicked', method='GET')
def folderClicked():
    return "File"


run(host='localhost', port=6003)
