FROM dimitri/pgloader:v3.6.7

ADD lportal.load /
ADD rules.sql /

ENTRYPOINT /usr/local/bin/pgloader /lportal.load