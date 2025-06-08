#!/usr/bin/bash

read -r -p "put custom directory name as argument to script otherwise
current directory name will be used as the virtual env name
ensure pyenv global is set to specific python version (only python3 or python2 - not both)
pyenv global is set to:- 
$(pyenv global)
ensure you are in correct working directory
PWD: $PWD
continue? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    if [ -z "$1" ]; then
        venv=$(basename "$PWD")
    else
        venv=$1
    fi

    pyenv virtualenv "$venv"
    pyenv local "$(pyenv global)/envs/$venv"
    echo "updating pip"
    python -m pip install --upgrade pip

    read -r -p "proceed with pip-tools install? [y/N] " response

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        pip install pip-tools
    fi
fi

