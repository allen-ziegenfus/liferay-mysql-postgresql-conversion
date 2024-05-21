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

## Debugging Errors

In the output that pgloader produces, it should show you whether any errors occurred while importing.

If the import wasn't aborted due to syntax errors or memory issues, you will see a final output table as follows:

```
   table name     errors       rows      bytes      total time
-------------------------------------------------  ---------  ---------  ---------  --------------
                                  fetch meta data          0       3962                     1.240s
                                   Create Schemas          0          0                     0.000s
                                 Create SQL Types          0          0                     0.004s
                                    Create tables          0       1340                     3.080s
                                   Set Table OIDs          0        670                     0.072s
-------------------------------------------------  ---------  ---------  ---------  --------------
                           public.quartz_triggers          1          0                     0.276s
```

Here we see that there was an error when importing `quartz-triggers`.

To get more information about the errors, you can study the logs or increase the log output by adding
`--debug` to the pgloader call in the entrypoint, i.e.:

`ENTRYPOINT /usr/local/bin/pgloader --debug /lportal.load`

If you want to reduce the scope of the import to narrow down where an error is or just to make the import faster to test, you can add an include statement to `lportal.load`, e.g. to only include the tables starting with A:

`INCLUDING ONLY TABLE NAMES MATCHING ~/^A/`

## Memory Errors

If pgloader crashes due memory issue you can try reducing the number of pre fetch rows in `lportal.copy`:

```WITH preserve index names, prefetch rows = 5000```

## Large Object Handling

For several tables (analyticsmessage, batchengineexporttask, batchengineimporttask, ctscontent, dlcontent) Liferay stores blog data not in the actual table but using a large object reference.

pgloader does not handle these types of columns. Instead the columns are imported by default as byte arrays (`bytea`) and then migrated to large objects in the `large_objects.sql` script. 

## Limitations

Primary key index constraints will not have the same names as in an "official" Liferay schema, since pgloader assigns them automatically.

Example:

`idx_52476_primary` vs `assetlistentryusage_pkey`
