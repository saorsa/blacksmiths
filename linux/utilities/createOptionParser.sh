#! /bin/bash
#set -x

dbUserEntered=false
hostEntered=false
dbNameEntered=false
databaseEntered=false
export backUpFolderEntered=false

while getopts ":u:h:b:n:d:l:" option
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
		 b)
		 	#backup folder
			export backUpFolderEntered=true
			export backUpFolder=$OPTARG
		 ;;
		 n)
		 	#database name to be dumped
			export dbNameEntered=true
			export dbName=$OPTARG
		 ;;
		 d)
			#database
			export databaseEntered=true
			export database=$OPTARG
		 ;;
		 l)
			#name of the craeted back up
		 	export backUpNameEntered=true
			export backUpName=$OPTARG
		 ;;
 		 *)
			return 1
		 ;;
	esac
done

