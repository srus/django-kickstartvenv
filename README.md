# django-kickstartvenv

Django project skeleton with [Virtualenv](https://github.com/pypa/virtualenv).

## Main features

- Common skeleton for a broad range of Django projects.
- Project deployment in one build step.
- IPython pre-configured for compatibility with Python 3 syntax.
- Some useful pre-configurations for your Virtualenv postactivate script.

## System requirements

- Python ^2.7.3
- Pip ^6.0.8
- Virtualenv ^12.0.7
- Virtualenvwrapper ^4.3.2

## Project deployment

Move to the same path as this file and run: `./bin/install.sh`

## Directory structure

- **bin/**: scripts.
- **boot/**: bootstrap templates for config files.
- **conf/**: config files; generated automatically on every build.
- **docs/**: project documentation.
- **requirements/**: Python dependencies.
- **src/**: your Django project lives here.

