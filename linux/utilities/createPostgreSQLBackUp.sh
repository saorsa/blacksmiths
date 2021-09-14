#! /bin/bash

usage=$'
'$0' [-u username] [-h host] [-b back_up_name] [-n database_name]
Creates a database back up for PostgreSQL:
    -u  database user - mandatory option
    -h  host - mandatory option
    -l  name of the back up that will be created - mandatory option
    -n  name of the database that will be backed up - mandatory option
	'

#input validation
. ./createOptionParser.sh $@
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

pg_dump -U $dbUser -h $host -w $dbName > $backUpName
