# Converting a Liferay database from MySQL to PostgreSQL

This repo contains a pgloader script for converting a Liferay MySQL database to PostgreSQL.

This has only been tested with Liferay 7.4 u112 so it may be missing changes required for other versions. It was developed by comparing freshly created MySQL and PostgreSQL databases with the pgloader MySQL -> PostgreSQL equivalent and adjusting the pgloader script for some of the data type subtleties. It also includes the PostgreSQL rules for handling large objects. It was tested with Liferay 7.4.

To use it, place a MySQL dump file in the `/mysql/docker-entrypoint-initdb.d/` and run:

- `docker-compose build`
- `docker-compose up`

If you need to start over or work with a different database, then clear the MySQL volume with `docker-compose down -v`

The `dump.sh` script will export the migrated PostgreSQL database to a dump file.

This is presented without any guarantee or warranty. This might not cover all edge cases, especially for
any specialized tables (e.g. object tables) that are not part of the initial Liferay database.
