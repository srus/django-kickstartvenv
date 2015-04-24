# django-kickstartvenv [![Build status](https://travis-ci.org/srus/django-kickstartvenv.svg?branch=master)](https://travis-ci.org/srus/django-kickstartvenv)

Start your next [Django](https://www.djangoproject.com/) based project with a pre-configured virtual environment in a few seconds.

## Main features

- Common skeleton for a broad range of Django projects.
- Project deployment in one build step.
- Pre-configured virtual environment for Python (thanks to [Virtualenv](https://github.com/pypa/virtualenv) and [Virtualenvwrapper](https://bitbucket.org/dhellmann/virtualenvwrapper/)).
- IPython pre-configured for compatibility with Python 3 syntax.
- Some useful pre-configurations for Virtualenvwrapper [postactivate](http://virtualenvwrapper.readthedocs.org/en/latest/scripts.html#postactivate) script.

## System requirements

- [Python](https://www.python.org/)
- [Pip](https://pypi.python.org/pypi/pip/)
- [Virtualenv](https://pypi.python.org/pypi/virtualenv/)
- [Virtualenvwrapper](https://pypi.python.org/pypi/virtualenvwrapper/)

Currently supporting Python 2.7, 3.3 and above. For more information about versions see the [Travis page](https://travis-ci.org/srus/django-kickstartvenv).

## Project deployment

1. Download this project.
2. Rename the folder as you want.
3. Add the Python dependencies in the `requirements` folder.
4. Move to the project root folder and run: `./bin/build.sh`. You can run this script whenever you need to update the project.

Finally type `workon` and the name of your virtualenv to start working on your new project. See the [Virtualenvwrapper docs](http://virtualenvwrapper.readthedocs.org/) to learn more about the workflow with this virtual environments manager.

## Directory structure

- **bin/**: scripts.
- **boot/**: bootstrap templates for config files.
- **conf/**: config files (generated automatically on every build).
- **docs/**: project documentation.
- **requirements/**: Python dependencies.
- **src/**: your Django project will be here.
