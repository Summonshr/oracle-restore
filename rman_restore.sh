/oracle/app/oracle/product/12.1.0.1/db_1/bin/rman target / nocatalog log = /home/oracle/rman_restore/rman-restore.log append <<EOF
run
{
ALLOCATE CHANNEL c1 DEVICE TYPE DISK;
ALLOCATE CHANNEL c2 DEVICE TYPE DISK;
ALLOCATE CHANNEL c3 DEVICE TYPE DISK;
ALLOCATE CHANNEL c4 DEVICE TYPE DISK;
ALLOCATE CHANNEL c5 DEVICE TYPE DISK;
restore database;
recover database;
release channel c1;
release channel c2;
release channel c3;
release channel c4;
release channel c5;
}
