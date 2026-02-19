#!/bin/bash 
NAME=$1 
if [ -z "$NAME" ]; then 
echo "사용법: $0 이름" 
exit 1 
fi 
mysql -ushell -pshell shell_db -e \ 
"INSERT INTO members(name) VALUES('$NAME');" 
echo "👤 $NAME 사용자 등록 완료"
# $1 = 첫 번째 전달 인자
# 쉘 → DB 데이터 입력 