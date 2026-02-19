#!/bin/bash
set -euo pipefail # -euo: 실패시 pipefail
USER="shell" 
PASS="shell" 
DB="shell_db" 
OUT="members.txt" 
mysql -u"$USER" -p"$PASS" "$DB" -e "SELECT * FROM members;" > "$OUT" 
echo "📄 조회 결과 $OUT 저장 완료"