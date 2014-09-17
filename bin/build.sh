#!/bin/bash

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

# Save current path
proj_path="`pwd`"

# Check if dir exists
if [[ ! -d "conf" ]]; then
    mkdir "conf"
fi

# Build virtualenv environment
source /usr/local/bin/virtualenvwrapper.sh
mkvirtualenv "$venv_name"

# Set and activate virtualenv postactivate script
cd "${proj_path}/boot/virtualenv/bin/"
cp postactivate.skel postactivate
p="${proj_path//\//\\/}"  # escape forward slashes
sed -i "s/{{path}}/$p/g" postactivate
mv -f postactivate "${WORKON_HOME}/${venv_name}/bin/postactivate"
deactivate
source /usr/local/bin/virtualenvwrapper.sh
workon "$venv_name"

echo ""
echo -e "${txtgrn}Installing Python packages...${txtrst}"
echo ""

# Install Python packages
pip install -U -r requirements/development.txt

echo ""
echo -e "${txtgrn}Configuring IPython...${txtrst}"
echo ""

# Set IPython default profile
ipython profile create
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

# Finally cleaning up...
unset txtrst
unset txtylw
unset txtgrn
unset bldgrn
unset venv_name
unset proj_path
unset django_name
unset p

exit 0
