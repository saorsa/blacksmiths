#! /bin/bash

. ./mysql.backup.properties.sh

mysqlUserName=$USER_NAME
host=$HOST
dbName=$DB_NAME
backUpDB=$BACKUP_NAME

while getopts ":u:h:d:b:r:" option
do
	case "${option}"
	in

 		 u)
            mysqlUserName=$OPTARG
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


mysqldump -u $mysqlUserName -h $host $dbName > $backUpDB 