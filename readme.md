# Instructions

---

## Configuration:

##### .env

    POSTGRES_USER_USER=VAL - Username to use for connection to database
    POSTGRES_USER_PASSWORD=VAL - Password to user for connection to database
    POSTGRES_USER_DB=VAL - Name of database to connect
    POSTGRES_USER_HOST=VAL - Host of database to connect
    POSTGRES_USER_PORT=VAL - Port of database to connect

##### [modules/config.py](modules/config.py)

    TABLE_NAME - Name of table in database to create
    LOCATIONS_TABLE_NAME - Name of table in which location of city
    RESULT_PLOT_PATH - File to file with image of result plot

---

## Start the application:

1. Start `Docker Engine`.


2. Download/unpack project into desire folder.  


3. Open console in the same folder as project.  


4. Run following command to build application:
    ```
    $ docker-compose build
    ```

5. Run following command to *start* application:
   ```
   $ docker-compose up
   ```

**Note**: Command to *stop* application:
```
$ docker-compose down
```

---