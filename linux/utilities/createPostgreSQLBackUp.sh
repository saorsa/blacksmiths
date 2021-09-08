#! /bin/bash

. ./pgsql.backup.properties.sh

psqlUserName=$USER_NAME
host=$HOST
dbName=$DB_NAME
backUpDB=$BACKUP_NAME

while getopts ":u:h:d:b:" option
do
	case "${option}"
	in

 		 u)
            psqlUserName=$OPTARG
		 ;;
 		 h)
		  	host=$OPTARG
		 ;;
         d)
            dbName=$OPTARG
         ;;
         b)
            backUpDB=$OPTARG
         ;;
 		 *)echo "not a valid option";;
	esac
done

pg_dump -U $psqlUserName -h $host -w $dbName > $backUpDB
