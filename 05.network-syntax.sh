# 패키지 매니저란?
# 개발 환경에서는 프로그램(소트프웨어, 라이브러리)을 설치할 때 패키지
# 매니저를 사용한다.
# 운영체제나 개발 환경에 따라서 다르다.
# node환경 -> npm, yarn
# spring 환경 -> gradle, maven(xml기반)
# python환경 -> pip
# 리눅스 -> apt, yum, dnf 등
# 패키지 매니저는 설치, 업데이트, 제거 할 때 사용함.
apt update : 패키지 목록을 최신화한다.(동기화를 지원하지 않음)
apt install 패키지명
apt remove 패키지명
apt upgrade : 패키지를 업데이트함
# apt패키지 저장소로 부터 nginx프로그램을 다운받아야 한다.-> 설치
# Ubuntu컴퓨터가 가지고 있는 apt패키지 목록은 apt저장소와 실시간으로
# 동기화 되지 않음. - 수동으로 해야함.
sudo apt install nginx

# 설치된 패키지 확인하기
sudo apt list --installed

# 설치된 특정 패키지 확인
sudo apt list --installed | grep 패키지명

# 패키지 제거
# 패키지 제거에는 apt purge말고 apt remove 명령어도 있다.
# apt remove는 설정 파일을 남겨둔 채로 패키지를 삭제하기 때문에
# apt purge를 주로 사용함.
sudo apt purge --auto-remove 패키지명

### [실습] apt를 활용해서 Nginx설치하기
#1. 패키지 목록 최신화
sudo apt update
#2. Nginx 설치
sudo apt install nginx
#3. Nginx 설치 확인
sudo apt list --installed | grep nginx
#4. Nginx 서비스 시작
sudo systemctl start nginx
#5. Nginx서비스 상태 확인
sudo systemctl status nginx
#6. Nginx서비스 중지
sudo systemctl stop nginx
#7. Nginx 서비스 삭제
sudo apt purge --auto-remove nginx
# 8. 참고자료
  https://yooloo.tistory.com/139


### apt명령어 사용시 sudo쓰는 이유
# 1. 시스템 영역이라서  보호된 경로를 수정함.
# 프로그램 설치: /usr/bin, /usr/lib
# 설정파일 : /etc/
# 패키지 DB/캐시 : /var/lib/dpkg, /var/cache/apt/
# 위 경로들은 일반 사용자에게 쓰기 권한이 없음. root만 가능함.
# sudo를 붙여서 잠깐 root권한을 빌려서 실행하기
# 2. 보안때문에 아무나 설치/삭제 못하게 막음.
# 일반사용자가 마음대로 설치/업그레이드 가능하게 하면???
# 리눅스는 기본적으로 권한(permissions)으로 시스템 보호함.
# 3. 명령 1개에 대해 권한 상승해줌
# 누가 언제 어떤 명령을 sudo로 실행했는지 기록(log)이 남음.
# 4. 모든 apt명령에 sudo가 필요한 건 아님
# 시스템 변경하는 경우 이때는 필수
# apt 조회, 검색, 


# 네트워크 관련 명령어
sudo apt update

sudo apt install net-tools
# 이전 부터 지원
# 나의 IP정보 등 네트워크 설정 정보 출력
# 윈도우 : ipconfig, 리눅스 : ifconfig 
ifconfig
# 최근버전 지원
ip addr
# 네트워크 연결 상태 확인
ping IP주소

# DNS란?
# 사람이 쓰는 도메인을 컴퓨터가 이해하는 IP로 변경해줌

# nslookup : 특정 도메인의 IP주소 매핑을 조회할 때 사용
# DNS서버 조회

# port는 서비스를 결정짓는 단위이다.

# 네트워크 연결 상태 조회(port사용)
# nc -zv 또는 telnet:특정 port까지 열려 있는지 확인
# 주의 : telnet은 실제 데이터 전송하여 연결상태 확인해줌
# 차단되거나 권장되지 않음.

# ssh는 원격 접속 명령어
# 리눅스는 기본적으로 멀티 사용자 접속을 지원
# 원격 접속 명령어
ssh -i ubuntuXXX-key.pem ubuntu@ip주소
# 원격 호스트와의 터미널 세션을 제공
# scp : 파일 원격 전송
# ex) scp [source file] [destination file]
