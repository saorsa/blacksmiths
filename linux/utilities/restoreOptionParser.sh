#! /bin/bash

export dbUserEntered=false
export hostEntered=false
export backUpFolderEntered=false
export dbNameEntered=false
export databaseEntered=false
export backUpNameEntered=false
export removeDatabaseEntered=false
export removeDatabase=no

while getopts ":u:h:b:n:d:r:" option
do
	case "${option}"
	in
		 u)
		 	#database user
		 	export dbUserEntered=true
			export dbUser=$OPTARG
		 ;;
		 h)
		 	#host name
			export hostEntered=true
			export host=$OPTARG
		 ;;
		 f)
		 	#folder that contains the backup
			export backUpFolderEntered=true
			export backUpFolder=$OPTARG
		 ;;
         b)
            #date of the backup that will be restored
            export backUpNameEntered=true
            export backUpDate=$OPTARG
         ;;
		 n)
		 	#database name to be restored or latest
			export dbNameEntered=true
			export dbName=$OPTARG
		 ;;
		 d)
			#database
			export databaseEntered=true
			export database=$OPTARG
		 ;;
         r)
            #drop database before restore
            export removeDatabaseEntered=true
            export removeDatabase=$OPTARG
         ;;
 		 *)
			return 1
		 ;;
	esac
done
