#!/bin/bash 
mysql -ushell -pshell shell_db <<EOF 
CREATE TABLE IF NOT EXISTS members ( 
  id INT AUTO_INCREMENT PRIMARY KEY, 
  name VARCHAR(50), 
  regdate DATETIME DEFAULT NOW() 
); 
EOF 
echo "📦 members 테이블 생성 완료"