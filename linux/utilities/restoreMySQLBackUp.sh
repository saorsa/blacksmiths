#! /bin/bash

usage=$'
'$0' [-u username] [-h host] [-b back_up_date/latest] [-n database_name] [-r yes/no]
Restores a database back up for MySQL:
    -u  database user - mandatory option
    -h  host - mandatory option
    -b  date of the backup file or latest to restore the last created backup (date format YYYY-MM-DD-HH-mm) - mandatory option
    -n  the name of the database that the backup file will be restored to - mandatory option
    -r  drop database before restore. If not specified the database wont be droped
	'

#input validation
. ./restoreOptionParser.sh $@
if [ ! $? = 0 ]; then
	echo "$usage"
	exit 1
fi

if [ "$dbUserEntered" = false ] || 
   [ "$hostEntered" = false ] || 
   [ "$dbNameEntered" = false ] || 
   [ "$backUpNameEntered" = false ]; 
   then
	echo "$usage"
	exit 1
fi

if [ "$removeDatabase" == "yes" ]; then
    mysql -u $dbUser -h $host -e "drop database $dbName;" &>/dev/null
fi

mysql -u $dbUser -h $host -e "create database $dbName;" &>/dev/null
mysql -u $dbUser -h $host $dbName < ./$backUpDate &>/dev/null