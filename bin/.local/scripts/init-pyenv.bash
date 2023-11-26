#!/usr/bin/bash

read -r -p "put custom directory name as argument to script otherwise
current directory name will be used as the virtual env name
ensure pyenv global is set to desired python version
current version: $(python --version)
ensure you are in correct working directory
PWD: $PWD
continue? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    if [ -z "$1" ]; then
        venv=$(basename $PWD)
    else
        venv=$1
    fi

    pyenv virtualenv "$venv"
    pyenv local "$(pyenv global)/envs/$venv"

    read -r -p "proceed with pip-tools install? [y/N] " response

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        pip install pip-tools
    fi
fi

