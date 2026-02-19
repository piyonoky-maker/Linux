# 쉘 스크립트 와 쉘 프로그래밍
# 1. 쉘( Shell )이란?
# 사용자와 리눅스 커널 사이의 통역
# 우리가 입력한 명령을 커널이 이해할 수 있게 전달
```
사용자 -> Shell -> Kernel -> Hardware
```

# 쉘 스크립트란?
# 여러 리눅스 명령어를 파일( XXX.sh )로 묶어 자동 실행하는 프로그램
# 반복, 조건, 서버관리, 배치작업에 필수
# 매일 서버 로그 정리 - 자동화
# 서버 상태 점검 - 실수 감소
# 개발 환경 세팅 - 빠른 배포

# 퀴즈
#1. 터미널창에 "script practice start" 문구 출력
echo "script practice start"
#2. 홈디렉토리에서 mydir 이라는 폴더를 생성
mkdir mydir
#3. 해당 폴더로 이동
cd mydir
#4. file1.txt, file2.txt 파일을 생성
touch file1.txt file2.txt
#5. file1.txt에는 hello world1, file2.txt에는 hello world2 문구 추가 
echo "hello world1" >> file1.txt
echo "hello world2" >> file2.txt
#6. file1.txt파일을 copy본을 생성(file1_backup.txt), file2.txt의 이름을 file2_rename.txt 변경
cp file1.txt file1_backup.txt
mv file2.txt file2_rename.txt
#7. 터미널창에 "script practice complete" 문구 출력
echo script practice complete

chmod 766 test.sh

# if 문
if [조건식]; then
  //실행문
else
fi

if [1 -gt 2]; then # 1 is greater then 2
  //실행문
  echo "1 is greater then 2"
else
  echo "1 is not greater then 2"
fi

# if문 2번째

file_name="a.txt"
if [ -f "$file_name" ]; then
  echo "$file_name 파일이 존재합니다"
else
  echo "$file_name 파일이 존재하지 않습니다"
fi
