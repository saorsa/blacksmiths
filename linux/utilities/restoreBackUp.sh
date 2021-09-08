#!/bin/bash

POSPARAM=("$@")

findBackup () {
    if [ "${POSPARAM[1]}" == "latest" ]; then
        backupName=$(ls -rt /$BACKUP_FOLDER/ | tail -n 1)
    else
        backupName=${POSPARAM[0]}"_"${POSPARAM[1]}".tar.gz"
    fi
    
    backupLocation=$BACKUP_FOLDER$backupName
    if [ -f $backupLocation ]; then
        tar -xzf $backupLocation -C ./
    else 
        echo ${POSPARAM[0]}" backup from "${POSPARAM[1]}" does not exist"
    fi
    backupName=$(echo $backupName | cut -d"." -f1)
}

if [ "$1" == "mysql" ]; then
    . ./mysql.backup.properties.sh
    findBackup
    . ./restoreMySQLBackUp.sh -d $3 -b $backupName -r $4
    rm ./$backupName    
    
elif [ "$1" == "postgresql" ]; then
    . ./pgsql.backup.properties.sh
    findBackup
    . ./restorePostgreSQLBackUp.sh -d $3 -b $backupName -r $4
    rm ./$backupName
fi