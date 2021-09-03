#### How to work with createBackUp.sh
  - how to use
    - options
      - p:arg - create a backup of the psotgresql databases. The argument is the name of the db that should be backed up.
      - m:arg - create a backup of the mysql databases. The argument is the name of the db that should be backed up.

#### How to work with restoreBackUp.sh
 - how to use
   - arguments
     - mysql/postgresql - both MySQL and PostgreSQL are supported by the script
     - date/latest - choose either the latest backup or a an older backup by specifing the date. The date is in the following format *YYYY-MM-DD-HH-mm*
     - name of db - the name of the database to be used. If it does no exist it will be created.
     - yes/no - specify if the database should be dropped before restoring it.

#### Configuration
 - files **mysql.backup.properties.sh** and**pgsqlbackup.properties.sh** define the location inwhichthe archived backup will be stored. Bothfilescontain an exported virable calledBACKUP_FOLDERwhich contains the desired path
 ```bash
 export BACKUP_FOLDER=/desired path/
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
