FROM dimitri/pgloader:ccl.latest

ADD lportal.load /
ADD large_objects.sql /
ADD rules.sql /

ENTRYPOINT /usr/local/bin/pgloader --verbose /lportal.load