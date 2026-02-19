#!/bin/bash 
mysql -ushell -pshell shell_db <<EOF 
INSERT INTO members (name) VALUES ('John'); 
INSERT INTO members (name) VALUES ('Jane'); 
INSERT INTO members (name) VALUES ('Jim'); 
EOF 
echo "📝 members 테이블에 데이터 추가 완료"