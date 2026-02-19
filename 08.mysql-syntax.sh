# MySql 쉘 스크립트


#!/bin/bash 
# 이 파일을 bash 쉘 스크립트로 실행할 예정
# ./check_mysql.sh로 실행할때 어떤 해석기를 쓸지 지정하기

USER="shell" 
PASS="shell" 
DB="shell_db" 
SERVICE="mysql" 
echo "🔍 MySQL 접속 상태 확인 중..."  # 터미널에 출력됨
mysql -u$USER -p$PASS $DB -e "SELECT 1;" >/dev/null 2>&1  # 2번은 결과가 화면에 보이지 않게함
  # -e: MySql에 들어가지 않고 쿼리만 실행하고 종료하기
  # >/dev/null: 표준출력 ( stdout )를 버림( 화면에 결과가 보이지 않음 )
  # 2>&1: 표준에러 ( stderr )도 표준출력과 같은 곳으로 보냄
  # 결과//에러 화면에 출력하지 않고 성공/실패 ( 종료코드 ) 만으로 판단 처리
if [ $? -eq 0 ]; then # $? == 0 성공
  echo "✅ MySQL 접속 성공 (서버 정상 동작 중)" 
  exit 0 
  # 접속 성공시 스크립트를 정상 종료 해주세요
fi 
  echo "⚠ MySQL 접속 실패 → 서버 기동 시도" 
  # MySQL 서비스 기동 
  sudo systemctl start $SERVICE 
  # 서버 기동 대기 ( sleep 3: 3초 대기 )
  sleep 3
  echo "🔁 MySQL 재접속 시도..." 
  mysql -u$USER -p$PASS $DB -e "SELECT 1;" >/dev/null 2>&1 
if [ $? -eq 0 ]; then 
  echo "🚀 MySQL 서버 기동 성공 + 접속 성공"
else 
  echo "❌ MySQL 서버 기동 실패 또는 접속 불가" 
  exit 1 
fi