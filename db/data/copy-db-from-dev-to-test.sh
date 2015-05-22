pg_dump -h 192.168.99.100 -p 5432 --username=postgres -d ds2 --file=ds2.dump --format=c
pg_restore -h 192.168.99.100 -p 5432 --username=postgres -d ds2-test -c ds2.dump
