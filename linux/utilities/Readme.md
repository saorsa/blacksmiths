#### How to work with **createBackUp.sh**
  - createBackUp.sh [-u username] [-h host] [-b back_up_folder] [-n name_of_database_to_be_backed_up] [-d mysql/postgresql]
  
    Creates a database back up for MySQL or PostgreSQL:
    - u  database user - mandatory option
    - h  host - mandatory option
    - b  folder to store the craeted back up. If not sepcified will use default folder.
    - n  the name of the database that will be backed up - mandatory option
    - d  mysql/postgresql - mandatory option

#### How to work with **createPostgreSQLBackUp.sh**
  - createPostgreSQLBackUp.sh [-u username] [-h host] [-l back_up_name] [-n database_name]
  
    Creates a database back up for PostgreSQL:
    - u  database user - mandatory option
    - h  host - mandatory option
    - l  name of the back up that will be created - mandatory option
    - n  name of the database that will be backed up - mandatory option

#### How to work with **createMySQLBackUp.sh**
  - createMySQLBackUp.sh [-u username] [-h host] [-l back_up_name] [-n database_name]
  Creates a database back up for MySQL:
    - u  database user - mandatory option
    - h  host - mandatory option
    - l  name of the back up that will be created - mandatory option
    - n  name of the database that will be backed up - mandatory option

#### How to work with **restoreBackUp.sh**
 - restoreBackUp.sh [-u username] [-h host] [-f back_up_folder] [-b date_of_the_backup/latest] [-n name_of_database] [-d mysql/postgresql [-r yes/no]]
  
    Restores a database back up to MySQL or PostgreSQL:
    - u  database user - mandatory option
    - h  host - mandatory option
    - f  folder that contains the back up. If not sepcified will search in default folder.
    - b  date of the backup file or latest to restore the last created backup (date format YYYY-MM-DD-HH-mm)- mandatory option
    - n  the name of the database that the backup file will be restored to - mandatory option
    - d  mysql/postgresql - mandatory option
    - r  drop database before restore. If not specified the database wont be droped.

#### How to work with **restorePostgreSQLBackUp.sh**
  - restorePostgreSQLBackUp.sh [-u username] [-h host] [-b back_up_date/latest] [-n database_name] [-r yes/no]
  
    Restores a database back up for PostgreSQL:
    - u  database user - mandatory option
    - h  host - mandatory option
    - b  date of the backup file or latest to restore the last created backup (date format YYYY-MM-DD-HH-mm) - mandatory option
    - n  the name of the database that the backup file will be restored to - mandatory option
	- r	drop database before restore. If not specified the database wont be droped

#### How to work with **restoreMySQLBackUp.sh**
  - restoreMySQLBackUp.sh [-u username] [-h host] [-b back_up_date/latest] [-n database_name] [-r yes/no]
  
    Restores a database back up for MySQL:
    - u  database user - mandatory option
    - h  host - mandatory option
    - b  date of the backup file or latest to restore the last created backup (date format YYYY-MM-DD-HH-mm) - mandatory option
    - n  the name of the database that the backup file will be restored to - mandatory option
    - r   drop database before restore. If not specified the database wont be droped

#### Configuration
 - files **mysql.backup.properties.sh** and **pgsqlbackup.properties.sh** define the location in which the archived backup will be stored. Both files  contain an exported virables used for configurating the create and restore of backups. The needed variables in both file are:
 ```bash
export BACKUP_FOLDER=*postgresql/mysql backup folder path*
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
