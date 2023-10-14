#!/usr/bin/bash

read -r -p "ensure pyenv global is set to desired python version
current version: $(pyenv global)
ensure you are in correct working directory
PWD: $PWD
continue? [y/N] " response

if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    basename "$PWD" | xargs -I {} pyenv virtualenv "{}"
    pyenv local "$(pyenv global)/envs/$(basename $PWD)"

    read -r -p "proceed with pip-tools install? [y/N]" response

    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
        pip install pip-tools
    fi
fi

