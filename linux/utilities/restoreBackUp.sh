#!/bin/bash

POSPARAM=("$@")

findBackup () {
    backupLocation=$BACKUP_FOLDER$backupName
    if [ -f $backupLocation ]; then
        tar -xzf $backupLocation -C ./
    else 
        echo ${POSPARAM[0]}" backup from "${POSPARAM[1]}" does not exist"
    fi
}

findLastestBackup () {
    
}

if [ "$1" == "mysql" ]; then
    . ./mysql.backup.properties.sh
    backupName=$1"_"$2".tar.gz"
    findBackup    
    
elif [ "$1" == "postgresql" ]; then
    . ./pgsql.backup.properties.sh
    backupName=$1"_"$2".tar.gz"
    findBackup
fi