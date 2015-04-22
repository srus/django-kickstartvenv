# django-kickstartvenv [![Build status](https://travis-ci.org/srus/django-kickstartvenv.svg?branch=master)](https://travis-ci.org/srus/django-kickstartvenv)

Django project skeleton with [Virtualenv](https://github.com/pypa/virtualenv).

## Main features

- Common skeleton for a broad range of Django projects.
- Project deployment in one build step.
- IPython pre-configured for compatibility with Python 3 syntax.
- Some useful pre-configurations for your Virtualenv postactivate script.

## System requirements

- [Python](https://www.python.org/)
- [Pip](https://pypi.python.org/pypi/pip/)
- [Virtualenv](https://pypi.python.org/pypi/virtualenv)
- [Virtualenvwrapper](https://pypi.python.org/pypi/virtualenvwrapper/)

## Project deployment

Move to the same path as this file and run: `./bin/build.sh`. You can run this script both to install and update the project.

## Directory structure

- **bin/**: scripts.
- **boot/**: bootstrap templates for config files.
- **conf/**: config files; generated automatically on every build.
- **docs/**: project documentation.
- **requirements/**: Python dependencies.
- **src/**: your Django project lives here.

