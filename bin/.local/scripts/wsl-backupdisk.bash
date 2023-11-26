#!/usr/bin/bash
#wsl ubuntu doesn't identify external disk mount

if [ ! -d "/mnt/d" ]; then
    sudo mkdir -p /mnt/d
fi

sudo umount /mnt/d 2>/dev/null
sudo mount -t drvfs D: /mnt/d
cd $HOME

if [ "$1" = 'upload' ]; then
    tar cf finance.tar finance/
    tar cf work.tar work/
    tar cf rough.tar rough/

    cp finance.tar /mnt/d/
    cp work.tar /mnt/d/
    cp rough.tar /mnt/d/
    cp .zsh_history /mnt/d/
    rm finance.tar work.tar rough.tar

elif [ "$1" = 'download' ]; then
    cp /mnt/d/finance.tar ./
    cp /mnt/d/work.tar ./
    cp /mnt/d/rough.tar ./
    cp /mnt/d/.zsh_history ./

    tar xf finance.tar
    tar xf work.tar
    tar xf rough.tar
    rm finance.tar work.tar rough.tar

else
    echo "wsl-backupdisk.bash upload - upload private data to external ssd"
    echo "wsl-backupdisk.bash download - download private data from external ssd"
fi

sudo umount /mnt/d
