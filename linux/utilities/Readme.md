#### How to work with **createBackUp.sh**
  - how to use
    - options
      - p:arg - create a backup of the psotgresql databases. The argument is the name of the db that should be backed up.
      - m:arg - create a backup of the mysql databases. The argument is the name of the db that should be backed up.

#### How to work with **createPostgreSQLBackUp.sh**
  - how to use
    - options
      - u:arg - User for connecting to postgresql
      - h:arg - Host for connecting to postgresql
      - d:arg - Database that will be backed up
      - b:arg - The name of the back up file.
    - Note - none of the options are mandatory. If any of them are omitted, default values from **pgsqlbackup.properties.sh** will be taken.

#### How to work with **createMySQLBackUp.sh**
  - how to use
    - options
      - u:arg - User for connecting to mysql
      - h:arg - Host for connecting to mysql
      - d:arg - Database that will be backed up
      - b:arg - The name of the back up file.
    - Note - none of the options are mandatory. If any of them are omitted, default values from **mysqlbackup.properties.sh** will be taken.

#### How to work with **restoreBackUp.sh**
 - how to use
   - arguments
     - mysql/postgresql - both MySQL and PostgreSQL are supported by the script
     - date/latest - choose either the latest backup or a an older backup by specifing the date. The date is in the following format *YYYY-MM-DD-HH-mm*
     - name of db - the name of the database to be used. If it does no exist it will be created.
     - yes/no - specify if the database should be dropped before restoring it.

#### How to work with **restorePostgreSQLBackUp.sh**
  - how to use
    - options
      - u:arg - User for connecting to postgresql
      - h:arg - Host for connecting to postgresql
      - d:arg - Database in which the .sql backup will be restored to. This database must exist before executing the script.
      - b:arg - The .sql backup that will be restored.
      - r:arg - Drop database before restore - **yes/no**
    - Note - none of the options are mandatory. If any of them are omitted, default values from **pgsqlbackup.properties.sh** will be taken. The default values for *-r* is *no*

#### How to work with **restoreMySQLBackUp.sh**
  - how to use
    - options
      - u:arg - User for connecting to mysql
      - h:arg - Host for connecting to mysql
      - d:arg - Database in which the .sql backup will be restored to. This database must exist before executing the script.
      - b:arg - The .sql backup that will be restored.
      - r:arg - Drop database before restore - **yes/no**
    - Note - none of the options are mandatory. If any of them are omitted, default values from **mysqlbackup.properties.sh** will be taken. The default values for *-r* is *no*

#### Configuration
 - files **mysql.backup.properties.sh** and **pgsqlbackup.properties.sh** define the location in which the archived backup will be stored. Both files  contain an exported virables used for configurating the create and restore of backups. The needed variables in both file are:
 ```bash
export BACKUP_FOLDER=*postgresql/mysql backup folder path*
export USER_NAME=*default postgresql/mysql user for accessing the database*
export HOST=*default postgresql/mysql host*
export DB_NAME=*default name of the database to be backed up or restored*
export BACKUP_NAME=*default name for the back up*
 ```
 - In your home directory create files **.pgpass** and **.my.cnf**. The files contain the authorization information required respectivly for the postgresql and mysql databases. Both files must be with permisions 600(chmod 600 .pgpass/.mt.cnf)
   - Syntax of .pgpass
     ```
     hostname:port:database:username:password
     *Example - *:*:*:postgre_admin:ParolaRibaMech2*
     ```
   - Syntax of .my.cnf
     ```
     [client] 
     password = password
     *Example-
     [client]
     password = "ParolaRibaMech2"*
     ```
