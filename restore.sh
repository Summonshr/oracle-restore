echo exit | sqlplus / as sysdba @shutdown.sql
rm /database1/DATABASE/DATA/*.dbf
rm /database1/DATABASE/LOG/*.dbf
#rm /database1/DATABASE/CONTROL/*.ctl
echo exit | rman target / @controlfile.sql
echo exit | sqlplus / as sysdba @startup.sql
echo exit | rman target / @rman.sql
./rman_restore_citiuat.sh
echo exit | sqlplus / as sysdba @drop.sql
impdp system/sys#987 file=/database/NEWDUMP/UAT_CONFIG.dmp directory=DUMP full=yes log = CONFIG_29SEP20.log
