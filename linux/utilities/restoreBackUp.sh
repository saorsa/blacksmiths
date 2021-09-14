#!/bin/bash
#set -x
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

dbUserEntered=false
hostEntered=false
backUpFolderEntered=false
dbNameEntered=false
databaseEntered=false
backUpNameEntered=false
removeDatabase=no

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

while getopts ":u:h:b:n:d:r:" option
do
	case "${option}"
	in
		 u)
		 	#database user
		 	dbUserEntered=true
			dbUser=$OPTARG
		 ;;
		 h)
		 	#host name
			hostEntered=true
			host=$OPTARG
		 ;;
		 f)
		 	#folder that contains the backup
			backUpFolderEntered=true
			backUpFolder=$OPTARG
		 ;;
         b)
            #date of the backup that will be restored
            backUpNameEntered=true
            backUpDate=$OPTARG
         ;;
		 n)
		 	#database name to be restored or latest
			dbNameEntered=true
			dbName=$OPTARG
		 ;;
		 d)
			#database
			databaseEntered=true
			database=$OPTARG
		 ;;
         r)
            #drop database before restore
            removeDatabase=$OPTARG
         ;;
 		 *)
		  	echo "$usage"
			exit 1
		 ;;
	esac
done

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
    ./restoreMySQLBackUp.sh -u $dbUser -h $host -d $dbName -b $backupName -r $removeDatabase
    rm ./$backupName    
    
elif [ "$database" == "postgresql" ]; then

    if [ "$backUpFolderEntered" = false ]; then
		. ./pgsql.backup.properties.sh
		backUpFolder=$BACKUP_FOLDER
	fi

    findBackup
    ./restorePostgreSQLBackUp.sh -u $dbUser -h $host -d $dbName -b $backupName -r $removeDatabase
    rm ./$backupName
fi