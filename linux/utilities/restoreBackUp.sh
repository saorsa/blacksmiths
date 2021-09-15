#!/bin/bash

usage=$'
'$0' [-u username] [-h host] [-f back_up_folder] [-b date_of_the_backup/latest] [-n name_of_database] [-d mysql/postgresql [-r yes/no]]
Restores a database back up to MySQL or PostgreSQL:
    -u  database user - mandatory option
    -h  host - mandatory option
    -f  folder that contains the back up. If not sepcified will search in default folder.
    -b  date of the backup file or latest to restore the last created backup (date format YYYY-MM-DD-HH-mm)- mandatory option
    -n  the name of the database that the backup file will be restored to - mandatory option
    -d  mysql/postgresql - mandatory option
    -r  drop database before restore. If not specified the database wont be droped.
	'

if [ ! -f ~/.my.cnf ]; 
then
    echo "Credentials file .my.cnf not found at ${HOME}"
	exit 1
elif [ ! -f ~/.pgpass ];
then
	echo "Credentials file .pgpass not found at ${HOME}"
	exit 1
fi

findBackup () {
    if [ "$backUpDate" == "latest" ]; then
        backupName=$(ls -t /$backUpFolder/ | head -n 1)
    else
        backupName=$database"_"$backUpDate".tar.gz"
    fi
    
    backupLocation=$backUpFolder$backupName
    if [ -f $backupLocation ]; then
        tar -xzf $backupLocation -C ./
    else 
        echo $database" backup from "$backUpDate" does not exist"
    fi
    backupName=$(echo $backupName | cut -d"." -f1)
}

#input validation
. ./restoreOptionParser.sh $@
if [ ! $? = 0 ]; then
	echo "$usage"
	exit 1
fi

if [ "$dbUserEntered" = false ] || 
   [ "$hostEntered" = false ] || 
   [ "$dbNameEntered" = false ] || 
   [ "$databaseEntered" = false ]; 
   then
	echo "$usage"
	exit 1
fi

if [ "$database" == "mysql" ]; then

    if [ "$backUpFolderEntered" = false ]; then
		. ./mysql.backup.properties.sh
		backUpFolder=$BACKUP_FOLDER
	fi

    findBackup   
    ./restoreMySQLBackUp.sh -u $dbUser -h $host -n $dbName -b $backupName -r $removeDatabase
    rm ./$backupName    
    
elif [ "$database" == "postgresql" ]; then

    if [ "$backUpFolderEntered" = false ]; then
		. ./pgsql.backup.properties.sh
		backUpFolder=$BACKUP_FOLDER
	fi

    findBackup
    ./restorePostgreSQLBackUp.sh -u $dbUser -h $host -n $dbName -b $backupName -r $removeDatabase
    rm ./$backupName
fi