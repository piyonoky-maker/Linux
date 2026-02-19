# 1. 설치 전 준비 ( 업데이트 + 현재 상태 )
sudo apt update # 비번 물음: abcd1234

sudo apt intall -y openjdk-21-jdk

# 자바 버전 확인
java -version
javac -version

# 파일 위치 찾기
which java
which javac

# 아래 경로 형태로 출력됨
# /usr/lib/jvm/java-21-openjdk-amd64/bin/java
readlink -f $(which java)

# 실습 폴더 만들기
mkdir dev-java
cd dev-java

# 소스 파일 만들기
nano Hello.java

# 윈도우 vscode애서 작성한 코드 복사 붙여넣기
sudo apt-get install open-vm-tools-desktop