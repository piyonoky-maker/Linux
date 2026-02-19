# =========================
# 1) 프로세스 확인 기본
# =========================

# 현재 실행 중인 프로세스(프로그램) 목록을 확인하는 명령
# -e : 모든 프로세스 표시
# -f : 풀 포맷(UID, PID, PPID, 실행시간, 명령어 등 상세)으로 표시
ps -ef


# =========================
# 2) 패키지 관리(설치/업데이트) 개념
# =========================

# 패키지 관련 도구 설명:
# - yum : RedHat/CentOS 계열에서 사용
# - apt-get : Debian/Ubuntu 계열(구 방식)
# - apt : Debian/Ubuntu 계열(요즘 더 자주 쓰는 방식)
# 결론: Ubuntu 24에서는 보통 apt 사용


# =========================
# 3) 패키지 목록/업데이트
# =========================

# 설치 가능한 프로그램 목록(저장소 정보)을 최신으로 갱신
# - "업데이트"라기보다, "설치 목록을 최신화"하는 느낌
sudo apt update

# 설치된 패키지들을 최신 버전으로 업그레이드(업데이트 적용)
# - 시스템에 설치된 것들이 새 버전으로 올라갈 수 있음
# - 실습 서버에서는 보통 update 후 upgrade를 자주 함
sudo apt upgrade


# =========================
# 4) nginx 설치 및 실행(systemd)
# =========================

# nginx 설치
# - nginx는 대표적인 웹서버(정적 파일 제공) + 리버스 프록시(요청 전달) 역할
sudo apt install nginx

# systemd란?
# - 현대 리눅스에서 서비스(데몬)를 관리하는 표준 관리자
# systemctl이란?
# - systemd에게 "서비스 시작/중지/상태확인" 등을 요청하는 명령어

# nginx 서비스를 시작(start)
# - 백그라운드에서 웹서버가 떠서 요청을 받을 준비를 함
sudo systemctl start nginx

# 참고:
# systemctl : 프로그램(서비스)을 실행/중지/재시작/상태확인하는 관리 도구
# nginx : 웹 서버 소프트웨어


# =========================
# 5) curl로 nginx 동작 확인
# =========================

# curl : 터미널에서 HTTP 요청을 보내는 도구(브라우저 대신 테스트 가능)

# 기본 포트가 80이라서 :80을 생략해도 됨
curl http://localhost         # 기본 포트 80
curl http://localhost:80      # 포트 80 명시

# -I : 본문(body)은 안 받고, 응답 헤더(header)만 확인
# - 상태코드(200 OK)나 Server: nginx 같은 정보를 빠르게 확인 가능
curl -I http://localhost      # 헤더 정보 조회


# =========================
# 6) nginx 중지 및 프로세스 확인
# =========================

# nginx 서비스 중지(stop)
sudo systemctl stop nginx

# ps -ef 출력은 너무 길 수 있으므로 grep으로 nginx 관련 프로세스만 필터링
# 파이프(|)는 "왼쪽 결과를 오른쪽 입력으로 전달"하는 연결자
ps -ef | grep nginx

# 강제 종료(kill -9)
# - kill은 PID(프로세스ID)를 대상으로 신호를 보냄
# -9(SIGKILL)은 "즉시 강제 종료" (마지막 수단)
# - 보통은 -15(SIGTERM)로 정상 종료 시도 후, 안되면 -9 사용
kill -9 [프로세스ID]

# 다시 nginx 관련 프로세스가 남아있는지 확인
ps -ef | grep nginx


# =========================
# 7) Java 21 설치 및 확인
# =========================

# OpenJDK 21 JDK 설치
# - JDK에는 java(실행) + javac(컴파일러)가 포함됨
# - -y : 설치 중간 확인 질문에 자동으로 yes
sudo apt install openjdk-21-jdk -y

# java 런타임 버전 확인
java -version

# 자바 컴파일러 버전 확인
javac -version

# update-alternatives:
# - 여러 버전의 java가 설치되어 있을 때, "기본으로 쓸 java"를 관리하는 시스템
# 설치된 java 경로 목록을 확인
update-alternatives --list java


# =========================
# 8) JAVA_HOME 환경변수 등록(시스템 전역 설정)
# =========================
# 리눅스 로그인시 환경변수가 어떻게 로딩되나요?
# /etc/profile 시스템 전체 공통 설정
# profile.d안에 있는 내용들은 자동 실행대상이다.
# /etc/profile.d/*.sh 파일에 있는 모든 설정이 적용
# ~/.profile 사용자 개인 설정


# /etc/profile.d/ 아래에 .sh 파일을 만들면
# 로그인 셸(bash 등) 시작 시 자동으로 읽혀서 환경변수가 설정됨
sudo nano /etc/profile.d/java21.sh

# 아래와 같이 설정하면 누가 로그인을 하든
# 또는 새 터미널을 열 때 마다 JAVA_HOME, PATH가 자동 설정됨
# 아래 두 줄을 파일에 작성한다고 가정:
# JAVA_HOME : 자바 설치 경로(도구들이 이 경로를 참고)
# PATH      : 터미널에서 java/javac를 어디서든 실행 가능하게 경로 추가
export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

# 방금 만든 설정파일을 "현재 터미널 세션"에 즉시 적용
# (원래는 재로그인/새 터미널 열면 자동 적용됨)
source /etc/profile.d/java21.sh

# 설정 적용 후 java 버전 다시 확인
java -version
