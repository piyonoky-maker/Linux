# script2.sh - 백그라운드

#!/bin/bash                                             
set -e

LOG_FILE="linux-demo.log" 

echo "=========== Spring  Boot 배포 시작 ==========="             

./gradlew clean bootJar                                    

JAR_FILE=$(ls -t build/libs/*.jar | grep -v plain | head -n 1)

if [ -z "$JAR_FILE" ]; then
  echo "ERROR: 실행가능한 jar가 없습니다."
  exit 1
fi

echo "실행 대상 JAR: $JAR_FILE"
                                                                                            
chmod 744 "$JAR_FILE"               

echo "[$(date '+%Y-%m-%d %H:%M:%S')] START: $JAR_FILE" >> "$LOG_FILE"

nohup java -jar  "$JAR_FILE" >> "$LOG_FILE" 2>&1 &        

echo "서버 실행됨 (PID=$!)"

echo $! > linux-demo.pid





############################################################






#!/bin/bash
set -e
echo "==== Spring Boot 배포 시작 ===="

#git pull

./gradlew clean build

JAR_FILE=$(ls -t build/libs/*.jar | grep -v plain | head -n 1)

echo "실행대상 JAR: $JAR_FILE"

chmod 744 "$JAR_FILE"

java -jar "$JAR_FILE"