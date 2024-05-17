# Converting a Liferay database from MySQL to PostgreSQL

This repo contains a pgloader script for converting a Liferay MySQL database to PostgreSQL.

This has only been tested with Liferay 7.4 u112 so it may be missing changes required for other versions. It was developed by comparing freshly created MySQL and PostgreSQL databases with the pgloader MySQL -> PostgreSQL equivalent and adjusting the pgloader script for some of the data type subtleties. It also includes the PostgreSQL rules for handling large objects. It was tested with Liferay 7.4.

To use it: 

1. Place a MySQL dump file in the `/mysql/docker-entrypoint-initdb.d/`
2. `docker-compose build`
3. `docker-compose up`
4. Check the logs for any errors
5. Keep the docker containers running and in another terminal, run `dump.sh` to export the database
6. `docker-compose down` (or add `-v` to remove the volumes as well)

If you need to start over or work with a different database, then clear the MySQL volume with `docker-compose down -v`

This is presented without any guarantee or warranty. This might not cover all edge cases, especially for
any specialized tables (e.g. object tables) that are not part of the initial Liferay database.
