#!/bin/bash 
BACKUP_DIR=~/db_backup 
DATE=$(date +%Y%m%d_%H%M%S) 
mkdir -p $BACKUP_DIR 
mysqldump -ushell -pshell shell_db \ 
> $BACKUP_DIR/shell_db_$DATE.sql 
echo "💾 DB 백업 완료: shell_db_$DATE.sql"