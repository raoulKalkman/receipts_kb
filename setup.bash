#!/bin/bash
# written by Raoul Kalkman on 4/15/2022 used to set up all dependencies for the server so it can run out of box
# feel free to reuse this script / modify it as long as you buy me a beer if you use it
# this setup assumes it's ran on a debian based UNIX system 
# (on request a windows setup can be written, email raoulkalkman@outlook.com)

# some notes on bash syntax: 
# [[ expression ]] -> bool
# () -> subshell execution, {} -> current shell execution
# $? -> hold most recent ret value, generally 0 is good, all other is some error
# &> -> discard output

# checks if python3, python3.8-venv and make are installed, if not installs these
# exits with 1 if user is not root or something went wrong
function initVenv()
{
  # check for env packages
  for i in "${PRE_ENV_PACKAGES[@]}"
  do
    dpkg -s $i &> /dev/null # check if entry is installed

    if [[ $? -ne "0" ]]; then
      if [[ "$EUID" -ne "0" ]]; then
        # user is not root
        echo "$i needs to be installed, run sudo ./setup.bash in order to do this automatically"
        exit 1
      else
        # user is root -> install using apt-get
        apt-get -qq --yes --force-yes install $i
        if [[ $? -ne "0" ]]; then
          echo "Something went wrong installing package $i, please try again"
          exit 1
        fi
      fi
    fi
  done

  # create new Venv (to keep consistency between deployment + portability)
  python3 -m venv venv
}

# updates pip in venv and downloads all packages as described in requirements.txt
function installVenv()
{
  python -m pip install --upgrade pip
  echo -e "\tvenv initialised, downloading packages defined in requirements.txt"
  pip install -r requirements.txt
  echo -e "\tinstalled succesfully"
}

# initializes db as defined in __init__.py
function initDB()
{
  export FLASK_APP=server
  export FLASK_ENV=development
  flask init-db
}

PRE_ENV_PACKAGES=( python3 make python3.8-venv )

if [ ! -d "server/venv" ]; then
  initVenv
fi

. venv/bin/activate
installVenv
initDB
deactivate
echo ""
echo ""
echo ""

./run.bash

exit 0