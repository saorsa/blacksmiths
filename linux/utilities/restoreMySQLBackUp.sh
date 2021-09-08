#! /bin/bash

. ./mysql.backup.properties.sh

mysqlUserName=$USER_NAME
host=$HOST
dbName=$DB_NAME
backUpDB=$BACKUP_NAME
removeDB=no

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
         r)
            removeDB=$OPTARG
         ;;
 		 *)echo "not a valid option";;
	esac
done


if [ "$removeDB" == "yes" ]; then
    mysql -u $mysqlUserName -h $host -e "drop database $dbName;" &>/dev/null
fi

mysql -u $mysqlUserName -h $host -e "create database $dbName;" &>/dev/null
mysql -u $mysqlUserName -h $host $dbName < ./$backUpDB &>/dev/null