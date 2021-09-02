This is the explanation on how to work with createBackUp.sh
  - how to use
    - options
      - p - create a backup of the psotgresql databases
      - m - create a backup of the mysql databases
  - configuration
    - files **mysql.backup.properties.sh** and **pgsql.backup.properties.sh** define the location in which the archived backup will be stored. Both files contain an exported virable called BACKUP_FOLDER which contains the desired path

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