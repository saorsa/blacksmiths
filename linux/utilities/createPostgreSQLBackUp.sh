#! /bin/bash

usage=$'
'$0' [-u username] [-h host] [-b back_up_name] [-d database_name]
Creates a database back up for PostgreSQL:
    -u  database user - mandatory option
    -h  host - mandatory option
    -b  name of the back up that will be created - mandatory option
    -d  name of the database that will be backed up - mandatory option
	'

userNameEntered=false
hostEntered=false
databaseNameEntered=false
backupNameEntered=false

while getopts ":u:h:d:b:" option
do
	case "${option}"
	in

 		 u)
		  	userNameEntered=true
            psqlUserName=$OPTARG
		 ;;
 		 h)
		  	hostEntered=true
		  	host=$OPTARG
		 ;;
         d)
		 	databaseEntered=true
            dbName=$OPTARG
         ;;
         b)
		 	backupNameEntered=true
            backUpDB=$OPTARG
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

pg_dump -U $psqlUserName -h $host -w $dbName > $backUpDB
