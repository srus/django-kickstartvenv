# django-kickstartvenv [![Build status](https://travis-ci.org/srus/django-kickstartvenv.svg?branch=master)](https://travis-ci.org/srus/django-kickstartvenv)

Start your next [Django](https://www.djangoproject.com/) based project with [Virtualenv](https://github.com/pypa/virtualenv) in a few seconds.

## Main features

- Common skeleton for a broad range of Django projects.
- Project deployment in one build step.
- IPython pre-configured for compatibility with Python 3 syntax.
- Some useful pre-configurations for your Virtualenv [postactivate](http://virtualenvwrapper.readthedocs.org/en/latest/scripts.html#postactivate) script.

## System requirements

- [Python](https://www.python.org/)
- [Pip](https://pypi.python.org/pypi/pip/)
- [Virtualenv](https://pypi.python.org/pypi/virtualenv)
- [Virtualenvwrapper](https://pypi.python.org/pypi/virtualenvwrapper/)

Currently supporting Python 2.7, 3.3 and above. For more information about versions see the [Travis page](https://travis-ci.org/srus/django-kickstartvenv).

## Project deployment

- Download this project.
- Rename the folder as you want.
- Add the Python dependencies in the `requirements` folder.
- Move to the project root folder and run: `./bin/build.sh`.

You can run `build.sh` whenever you need to update the project.

## Directory structure

- **bin/**: scripts.
- **boot/**: bootstrap templates for config files.
- **conf/**: config files (generated automatically on every build).
- **docs/**: project documentation.
- **requirements/**: Python dependencies.
- **src/**: your Django project will be here.
