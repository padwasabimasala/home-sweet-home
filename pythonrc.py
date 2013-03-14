import os

if '.pythonrc.py' in os.listdir(os.getcwd()) and os.path.expanduser('~') != os.getcwd():
  execfile(os.getcwd() + '/.pythonrc.py')
