# 사용자가 현재 위치에 있는 폴더 경로 출력 명령어
pwd

# 현재 위치에서 파일 및 폴더 목록 조회
ls

# 목록 조회 자세히
ls -l

# 목록 조회시 숨김 폴더와 파일까지
ls -al

# 목록 조회 자세히 + 숨김파일 + 시간순 정렬
ls -alrt # 최신것 부터 : alt

# 디렉토리 만들기
mkdir work2601

# -p옵션을 사용하면 중간폴더가 없거나 이미 존재해도 에러발생하지
# 않음
mkdir -p project/var/log

# 특정 디렉토리로 이동
cd work2601

# 상위 디렉토리 이동
cd .. # 또는 cd ../

# 루트(최상위 폴더) 디렉토리로 이동
cd /

# 다시 기존의 work2601폴더로 돌아오기
cd home/kiwi/work2601 # 상대경로- 루트 경로에서 실행해야 work2601로 이동
cd /home/kiwi/workd2601 #절대경로: 어떤 폴더에서 명령어를 실행해도 이동

cd - # 직전 폴더로 이동

# 홈 ( 최초 로그인했을때 폴더 위치 ) 경로로 이동
cd

# 상대경로와 절대경로
cd ../../ # 내 위치를 기준으로 2단계 상위폴더로 이동 - 상대경로
cd /home # 내 위치와 상관없이 /home폴더로 이동 - 절대 경로

# nano 편집기 사용
nano a.txt

# Ctrl + O 엔터하면 저장
# Ctrl + X 나가기
# Ctrl + C 엔터하면 취소하기

# 파일 (a.txt) 만들어서 텍스트 입력하기
echo a1>>a.txt

# 상단에 추가
head -5 b.txt

# 하단에 추가
tail -t b.txt

# grep은 문자열을 특정 파일에서 찾아줌
# 현재 폴더에서 ( r ): 디렉토리 내의 모든 파일에서 문자열을 찾음
# ( i ): 대소문자 구분 없이 찾음
# ( n ): 몇번째 줄에 나타나는지를 출력
# ( c ):  해당 하는 문자의 갯수를 출력
# 파일내 단어 찾기
grep "Spring" c.txt ( -i | -n | -c )

# find: 이름으로 파일또는 디렉토리 찾기
find . -name "*.txt"

# 파이프 연산자로 파일을 찾기
find . -name "*.txt" | xargs grep -rni "Spring"


# find와 grep 혼용사용
# 횐쪽에서 찾은 파일 대상을 오른쪽으로 넘겨 해당 파일을 대상으로
# grep 명령어 실행
find . -name "*.txt" | xargs grep -rni "Spring"

# {}안에 find에서 찾은 대상이 들어가고 \;은 구문의 끝을 의미함
find . -name "*.txt" -exec grep -rni "Spring" {} \n

# 로그인에서 부터 현재까지 썼던 명령어 보기
history

# rm 은 삭제 명령어
rm a.txt

# 삭제 여부와 상관없이 강제 삭제 할 경우
rm -f a.txt

# 폴더 삭제시 r옵션은 파위폴더까지 포함 지움
rm -r project
rm -rf project

# cp는 파일이나 디렉토리를 복사하는 명령어
cp -r( f ) # 하위 디렉토리까지 모두 복사 ( r: recursive 의 약어 )

# cp 복사 대상 복사될 파일명
cp a.txt a_copy.txt

# mv는 파일 이동 명령어( 잘라서 붙여넣기 )
mv c.txt capture\cc.txt

# 파일이름 변경
mv cc.txt ccc.txt
mv text test  # 디렉토리 이름 변경
