#!/usr/bin/bash

read -r -p "put custom directory name as argument to script otherwise
current directory name will be used as the virtual env name
ensure pyenv global is set to desired python version
current version: $(pyenv global)
ensure you are in correct working directory
PWD: $PWD
continue? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
     if [ -z "$1" ]; then
        $1=$(basename $PWD)
     fi

    pyenv virtualenv "$1"
    pyenv local "$(pyenv global)/envs/$1"

    read -r -p "proceed with pip-tools install? [y/N] " response

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        pip install pip-tools
    fi
fi

