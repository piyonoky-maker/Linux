# 파일 확장자에 sh를 붙이면 VSCode에서 shell script로 인식함.
# 그래서 편의성을 제공해줌 

# 사용자 추가 - 관리자 권한 필요
useradd apple

# root권한을 빌려서 사용자 추가
# sudo 키워드는 현재 사용자의 비밀번호 입력이다 
sudo useradd apple

# 사용자 비밀번호 설정 - 관리자 권한 필요
# 비번 입력시 보이지 않지만 실제로 입력됨.
sudo passwd apple # abcd1234 입력함 - 2번 입력함

# 사용자 목록 조회
cat /etc/passwd

# 사용자 삭제 - 관리자 권한 필요
sudo userdel apple

# 사용자 목록 조회
cat /etc/passwd

# 계정은 만들어 졌지만 계정 폴더는 만들어지지 않음.
# 그래서 mkdir apple엔터하면 Permission denied 에러 발생.
mkdir apple

# 사용자 폴더를 만들어주는 명령어가 필요함.
sudo mkdir apple # 이 때 비번을 물어봄

su - apple # 이 때 apple계정의 비번 입력

pwd # 현재 폴더 조회

# 만일 다시 kiwi계정으로 돌아오려면 exit엔터

# 권한관리
# 소유자와 그룹에 대해 이해하기
# 소유자는 파일이나 디렉토리를 소유한 사용자
# 그룹은 파일이나 디렉토리를 소유한 사용자의 그룹
# 소유자에 대한 권한과 그룹에 대한 권한을 별개로 생각하기

# -rw-rw-r-- 1 kiwi kiwi 0 Jan 18 10:00 a.txt
# 소유자 : kiwi
# 그룹 : kiwi
# 파일크기 : 0
# 날짜 : Jan 18 10:00
# 파일명 : a.txt

# apple계정을 만들면 apple그룹이 자동으로 생성됨.
# 만일 -rw-rw-r-- 1 kiwi kiwi 0 Jan 18 10:00 a.txt이와 같을 때
# apple은 세번째 영역인 r--부분은 kiwi소유자도 아니고 그룹도 아닌 그외 영역에 해당함
# 만일 tomato라는 계정이 kiwi그룹에 속해 있다면 두번째 영역인 rw-부분에 권한 적용을 받음
# rwx는 리눅스가 파일이나 디렉토리에 대한 권한을 의미함 
# chmod는 권한 수정 명령어 : r(4), w(2), x(1)
# chmod 644 a.txt : 파일의 소유자에게는 읽기와 쓰기 권한을 부여, 그룹에게는 읽기 권한을 부여
chmod 644 파일명
chmod u+x 파일명
chmod u-w 파일명
chmod g+w 파일명
chmod o+w 파일명

ls -al

chmod 644 a.txt

ls -al

# 테스트 시나리오 
# a.txt파일에 644권한을 준 뒤 현재 계정이 아닌 다른 계정으로 전환하여 a.txt파일을 수정해 본다.
# 다른 계정은 4이므로 읽기권한만 있어 수정이 안되는 것을 확인할 수 있다.


# 소유자, 그룹 변경
sudo chown apple:apple a.txt