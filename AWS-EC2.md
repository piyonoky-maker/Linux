ssh -i ubuntu260120.pem ubuntu@15.164.96.211

## EC2에 Ubuntu24 환경설정 및 쉘 스크립트 실습
# =========================================================
# 1) EC2 인스턴스에 SSH로 접속
# =========================================================

# ssh : 원격 서버(EC2)에 터미널로 접속하는 명령
# -i  : 접속에 사용할 개인키(PEM 파일)를 지정
# ubuntu@IP : ubuntu 사용자로 해당 IP 서버에 접속
ssh -i ubuntu260120.pem ubuntu@16.176.140.88

# ✅ 주의(실무 포인트)
# - pem 파일은 "윈도우 로컬"에 있고, SSH는 그 파일을 이용해 서버에 접속함
# - pem 파일 권한/경로가 틀리면 "Permission denied (publickey)"가 뜰 수 있음


# =========================================================
# 2) 프로젝트를 EC2로 업로드 (SCP)
# =========================================================

# scp : SSH 기반 파일 전송(업로드/다운로드) 명령
# -i  : 전송에 사용할 pem 키 파일 지정(SSH 인증용)
# -r  : 폴더(디렉터리)를 재귀적으로 통째로 복사
# ./  : "현재 폴더" 전체를 의미 (Spring Boot 프로젝트 루트에서 실행하는 전제)
# ubuntu@IP:/home/ubuntu/nginx-app : 원격 서버의 목적지 경로
#
# 결과: 내 PC의 현재 폴더(프로젝트)가 EC2의 /home/ubuntu/nginx-app 으로 복사됨
~ 4. scp -i C:\ClassRoom\10Linux\ubuntu260120.pem -r ./ ubuntu@13.209.43.247:/home/ubuntu/nginx-app
scp -i C:\ClassRoom\10Linux\ubuntu260120.pem -r ./ ubuntu@15.164.96.211:/home/ubuntu/shell-mysql



# 위와 동일한 작업을 다른 EC2 IP로 업로드하는 예시(서버가 바뀜)
scp -i D:\082KOSMO2025\10.SpringSecurity\nginx-key.pem -r ./ ubuntu@16.176.129.58:/home/ubuntu/nginx-app

# ✅ 주의(윈도우 Git Bash/PowerShell)
# - 윈도우에서 scp를 실행할 때, 경로가 D:\... 형태로 먹히는 환경도 있고
#   /c/dev_lab/... 형태로 바꿔야 하는 환경(Git Bash)도 있음
# - 또한 EC2에 업로드 시, build 결과물/비밀키/.env 등을 그대로 올리는 것은 보안상 위험할 수 있어
#   보통은 Git clone 또는 빌드 산출물(JAR)만 올리는 방식을 더 권장함


# =========================================================
# 3) EC2(Ubuntu) 패키지 목록 갱신
# =========================================================

# apt update : 설치 가능한 패키지 목록(인덱스)을 최신으로 갱신
# (설치 전에 거의 항상 먼저 실행)
~ 1. sudo apt update

# sudo : 관리자 권한으로 실행(패키지 설치/시스템 설정에 필요)
# apt vs apt-get : 둘 다 가능하나, 최근에는 apt 사용이 더 편리함


# =========================================================
# 4) Docker 설치 준비 (필수 도구 설치)
# =========================================================

# apt-transport-https : (구식 환경에서) HTTPS 저장소 접근 지원
# ca-certificates     : SSL 인증서 패키지(https 통신 신뢰용)
# curl                : URL로 파일/데이터를 받아오는 도구
~ 2. sudo apt-get install apt-transport-https ca-certificates curl

# ✅ 참고
# Ubuntu 최신 버전에서는 apt-transport-https가 없어도 되는 경우가 많지만,
# 실습/호환성을 위해 설치해두면 안전함


# =========================================================
# 5) Docker 공식 GPG 키 등록
# =========================================================

# curl -fsSL ... : docker gpg 키 파일을 다운로드
#  -f : HTTP 에러면 실패 처리
#  -s :  조용히(진행 출력 줄이기)
#  -S : 에러 시 메시지 출력
#  -L : 리다이렉트 따라가기
#
# | (파이프): 왼쪽 명령의 출력(키 파일 내용)을 오른쪽으로 전달
# sudo apt-key add - : 전달받은 키를 apt에 등록
# (※ apt-key는 최신 권장 방식은 아니지만, 교육 자료에 많이 남아 있음)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# ✅ 주의
# 최근 Ubuntu에서는 /etc/apt/keyrings 방식이 권장됨(더 안전)
# 하지만 위 방식도 실습에서는 자주 사용됨


# =========================================================
# 6) Docker 저장소(레포지토리) 추가
# =========================================================

# add-apt-repository : 외부 저장소를 apt 소스 목록에 추가하는 명령
# 아래 문자열이 "Docker 공식 저장소"를 시스템에 등록하는 내용
#
# [arch=amd64] : CPU 아키텍처(대부분 EC2는 amd64)
# $(lsb_release -cs) : 현재 Ubuntu 코드네임 자동 삽입 (예: jammy, noble 등)
# stable : 안정(stable) 채널
sudo add-apt-repository \
"deb [arch=amd64] https://download.docker.com/linux/ubuntu \
$(lsb_release -cs) \
stable"


# =========================================================
# 7) Docker 설치
# =========================================================

# 저장소 추가 후에는 다시 apt-get update로 목록 갱신 필요
# 그 다음 docker-ce, docker-ce-cli, containerd.io 설치
#
# docker-ce      : Docker Engine(도커 본체)
# docker-ce-cli  : docker 명령어(cli)
# containerd.io  : 컨테이너 런타임(도커가 내부적으로 사용)
sudo apt-get update && sudo apt-get install docker-ce docker-ce-cli containerd.io


# =========================================================
# 8) Java 21(JDK) 설치 (Spring Boot 실행용)
# =========================================================

# openjdk-21-jdk : Java 개발/실행에 필요한 JDK 패키지
# (Spring Boot는 서버 실행만이면 JRE로도 가능하지만, 빌드/실습은 JDK가 안전)
~ 3. sudo apt install openjdk-21-jdk


# =========================================================
# 9) 설치 확인
# =========================================================

# java -version : 자바 설치/버전 확인
# 정상 출력이 나오면 JDK 설치 성공
java -version