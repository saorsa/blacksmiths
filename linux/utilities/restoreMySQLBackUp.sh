#! /bin/bash

usage=$'
'$0' [-u username] [-h host] [-b back_up_date/latest] [-d database_name] [-r yes/no]
Restores a database back up for MySQL:
    -u  database user - mandatory option
    -h  host - mandatory option
    -b  date of the backup file or latest to restore the last created backup (date format YYYY-MM-DD-HH-mm) - mandatory option
    -d  the name of the database that the backup file will be restored to - mandatory option
    -r   drop database before restore. If not specified the database wont be droped
	'

userNameEntered=false
hostEntered=false
databaseNameEntered=false
backupNameEntered=false
removeDB=no

while getopts ":u:h:d:b:r:" option
do
	case "${option}"
	in

 		u)
	     	userNameEntered=true
         mysqlUserName=$OPTARG
		;;
 		 h)
		  	hostEntered=true
		  	host=$OPTARG
		;;
      d)
		   databaseNameEntered=true
         dbName=$OPTARG
      ;;
      b)
		   backupNameEntered=true
         backUpDB=$OPTARG
      ;;
		r)
		   removeDB=$OPTARG
		;;
 		*)
		  	echo "$usage"
			exit 1
		 ;;
	esac
done

if [ "$userNameEntered" = false ] || 
   [ "$hostEntered" = false ] || 
   [ "$databaseEntered" = false ] || 
   [ "$backupNameEntered" = false ]; 
   then
	echo "$usage"
	exit 1
fi

if [ "$removeDB" == "yes" ]; then
    mysql -u $mysqlUserName -h $host -e "drop database $dbName;" &>/dev/null
fi

mysql -u $mysqlUserName -h $host -e "create database $dbName;" &>/dev/null
mysql -u $mysqlUserName -h $host $dbName < ./$backUpDB &>/dev/null