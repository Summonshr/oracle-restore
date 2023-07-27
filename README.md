# Database Maintenance and Restoration Instructions

This document outlines the necessary steps for database maintenance and restoration. Please follow the instructions carefully to ensure the smooth functioning of the database.

### Step 1: Shutdown the Database

To gracefully shut down the database, execute the following command:

```bash
echo exit | sqlplus / as sysdba @shutdown.sql
```

### Step 2: Remove Data and Log Files
Remove unnecessary data and log files from the specified directories using the following commands:

```bash
rm /database1/DATABASE/DATA/*.dbf
rm /database1/DATABASE/LOG/*.dbf
```

### Step 3: Control File Maintenance
You have the option to perform control file maintenance. Uncomment the following command if needed:

```bash
# rm /database1/DATABASE/CONTROL/*.ctl
```

### Step 4: Control File Restoration
Restore the control file using the following RMAN command:

```bash
echo exit | rman target / @controlfile.sql
```

### Step 5: Startup the Database
Startup the database after the maintenance using the following command:

```bash
echo exit | sqlplus / as sysdba @startup.sql
```

Step 6: RMAN Backup and Restoration
Execute the RMAN commands for backup and restoration:

```bash
echo exit | rman target / @rman.sql
```

### Step 7: Additional Restoration Script
Run the provided shell script for further database restoration:

```bash
./rman_restore_citiuat.sh
```

### Step 8: Drop the Database (Optional)
If required, you can drop the database using the following SQL*Plus command:

```bash
echo exit | sqlplus / as sysdba @drop.sql
```

### Step 9: Import Data Pump
To import data pump, use the following command:

```bash
impdp system/sys#987 file=/database/NEWDUMP/UAT_CONFIG.dmp directory=DUMP full=yes log = CONFIG_29SEP20.log
```

Please make sure to review and understand the commands before executing them. In case of any doubts or issues, refer to the documentation or consult with your database administrator.
