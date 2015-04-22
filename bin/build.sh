#!/usr/bin/env bash

# Some colors
txtrst='\e[0m'     # text reset
txtylw='\e[0;33m'  # regular yellow
txtgrn='\e[0;32m'  # regular green
bldgrn='\e[1;32m'  # bold green

# User prompt
echo ""
echo -en "${txtylw}Name of project's virtualenv: ${txtrst}"
read venv_name
echo -en "${txtylw}Name of Django project: ${txtrst}"
read django_name
echo ""

# Check system dependencies

if [[ -z "`which python`" ]]; then
    echo "FATAL: Could not find 'python'"
    echo "Please install Python: https://www.python.org/downloads/"
    exit 1
fi

if [[ -z "`which pip`" ]]; then
    echo "FATAL: Could not find 'pip'"
    echo "Please install Pip: https://pypi.python.org/pypi/pip/"
    exit 1
fi

if [[ -z "`which virtualenv`" ]]; then
    echo "FATAL: Could not find 'virtualenv'"
    echo "Please install Virtualenv: https://pypi.python.org/pypi/virtualenv/"
    exit 1
fi

venvwrapper="`which virtualenvwrapper.sh`"

if [[ -z "$venvwrapper" ]]; then
    echo "FATAL: Could not find 'virtualenvwrapper.sh'"
    echo "Please install Virtualenvwrapper: https://pypi.python.org/pypi/virtualenvwrapper/"
    exit 1
fi

# Current path
proj_path="`pwd`"

# Check if dir exists
if [[ ! -d "${proj_path}/conf" ]]; then
    mkdir "${proj_path}/conf" || { echo "FATAL: Could not create 'conf' directory"; exit 1; }
fi

# Build virtualenv environment
source "$venvwrapper"
mkvirtualenv "$venv_name"

# Set and activate virtualenv postactivate script
cd "${proj_path}/boot/virtualenv/bin/"
cp postactivate.skel postactivate
path="${proj_path//\//\\/}"  # escape forward slashes
sed -i "s/{{proj_path}}/$path/g" postactivate
mv -f postactivate "${VIRTUAL_ENV}/bin/postactivate"
deactivate
source "$venvwrapper"
workon "$venv_name"

echo ""
echo -e "${txtgrn}Installing Python packages...${txtrst}"
echo ""

# Install Python packages
pip install -U -r "${proj_path}/requirements/development.txt" || { echo "FATAL: Could not install Python packages"; exit 1; }

# Create link to Python packages
version='@([0-9]).@([0-9])'
ln -sf ${VIRTUAL_ENV}/lib/python${version}/site-packages "${proj_path}/python_packages" || { echo "FATAL: Could not symlink Python site-packages"; exit 1; }

echo ""
echo -e "${txtgrn}Configuring IPython...${txtrst}"
echo ""

# Set IPython default profile
ipython profile create || { echo "FATAL: Could not create IPython profile"; exit 1; }
ln -sf "${proj_path}/boot/ipython/ipython_config.py" "${proj_path}/conf/ipython/profile_default/ipython_config.py"

# Run migrations or create a new Django project
if [[ -d "src/${django_name}" ]]; then
    echo ""
    echo -e "${txtgrn}Running migrations...${txtrst}"
    echo ""
    cd "src/${django_name}"
    python manage.py migrate
else
    echo ""
    echo -e "${txtgrn}Creating Django project...${txtrst}"
    echo ""
    cd src
    django-admin.py startproject "${django_name}"
    cd "${django_name}"
    python manage.py migrate
fi

echo ""
echo -e "${bldgrn}OK, project deployed.${txtrst}"
echo ""

exit 0
