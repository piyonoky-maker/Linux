  #!/bin/bash 
USER="shelluser" 
PASS="1234" 
DB="shell_db" 
SERVICE="mysql" 
echo "🔍 MySQL 접속 상태 확인 중..." 
mysql -u$USER -p$PASS $DB -e "SELECT 1;" >/dev/null 2>&1 
if [ $? -eq 0 ]; then 
echo "✅ MySQL 접속 성공 (서버 정상 동작 중)" 
exit 0 
fi 
echo "⚠ MySQL 접속 실패 → 서버 기동 시도" 
# MySQL 서비스 기동 
sudo systemctl start $SERVICE 
# 서버 기동 대기 
sleep 3 
echo "🔁 MySQL 재접속 시도..." 
mysql -u$USER -p$PASS $DB -e "SELECT 1;" >/dev/null 2>&1 
if [ $? -eq 0 ]; then 
echo "🚀 MySQL 서버 기동 성공 + 접속 성공"
else 
echo "❌ MySQL 서버 기동 실패 또는 접속 불가" 
exit 1 
fi