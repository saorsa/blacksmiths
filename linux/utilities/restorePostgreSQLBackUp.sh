#! /bin/bash
. ./pgsql.backup.properties.sh

psqlUserName=$USER_NAME
host=$HOST
dbName=$DB_NAME
backUpDB=$BACKUP_NAME
removeDB=no

while getopts ":u:h:d:b:r:" option
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
		 r)
			removeDB=$OPTARG
		 ;;
 		 *)echo "not a valid option";;
	esac
done

if [ "$removeDB" == "yes" ]; then
     psql -U $psqlUserName -h $host marto_test -c "drop database $dbName;" #&>/dev/null
fi

psql -U $psqlUserName -h $host marto_test -c "create database $dbName;" #&>/dev/null

psql -U $psqlUserName -h $host $dbName < ./$backUpDB #&>/dev/null