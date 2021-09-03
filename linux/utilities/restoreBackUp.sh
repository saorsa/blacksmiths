#!/bin/bash

POSPARAM=("$@")

findBackup () {
    if [ "${POSPARAM[1]}" == "latest" ]; then
        backupName=$(ls /$BACKUP_FOLDER/ | tail -n 1)
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

deleteDatabase(){
    if [ "${POSPARAM[3]}" == "yes" ]; then
        if [ "${POSPARAM[0]}" == "mysql" ]; then
            mysql -u mysql_admin -h automata -e "drop database ${POSPARAM[2]};" &>/dev/null
            mysql -u mysql_admin -h automata -e "create database ${POSPARAM[2]};" &>/dev/null
        else
            psql -U postgre_admin -h automata marto_test -c "drop database ${POSPARAM[2]};" &>/dev/null
            psql -U postgre_admin -h automata marto_test -c "create database ${POSPARAM[2]};" &>/dev/null
        fi 

    elif [ "${POSPARAM[3]}" == "no" ]; then
        if [ "${POSPARAM[0]}" == "mysql" ]; then
            mysql -u mysql_admin -h automata -e "create database ${POSPARAM[2]};" &>/dev/null
        else
            psql -U postgre_admin -h automata marto_test -c "create database ${POSPARAM[2]};" &>/dev/null
        fi  

    else
        echo "Please enter yes or no"
        exit 1
    fi
}


if [ "$1" == "mysql" ]; then
    . ./mysql.backup.properties.sh
    findBackup
    deleteDatabase
    mysql -u mysql_admin -h automata $3 < ./$backupName
    rm ./$backupName    
    
elif [ "$1" == "postgresql" ]; then
    . ./pgsql.backup.properties.sh
    findBackup
    deleteDatabase
    psql -U postgre_admin -h automata $3 < ./$backupName &>/dev/null
    rm ./$backupName
fi