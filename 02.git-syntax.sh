# 패키지 목록 업데이트
# 최신 설치 목록 받아옴
sudo apt update

# Git설치
# git : 설치할 프로그램
# -y : 중간에 묻지 말고 자동 진행
sudo apt install git -y

# Git 버전 확인
git --version

# Git 설치 경로 확인
which git

# Git 기본 설정
# Git은 누가 커밋했는지 기록 해야 하므로 사용자 정보 설정 필요
git config --global user.name "본인정보"

# 이메일 설정
git config --global user.email "본인이메일"

# 설정 확인 
git config --list
