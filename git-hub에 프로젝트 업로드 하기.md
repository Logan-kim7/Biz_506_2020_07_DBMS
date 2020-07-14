# git-hub에 프로젝트 업로드 하기

### 최초로 git-hub에 프로젝트 업로드 하기
1. git init : 현재 폴더를 git-hub에 오릴기 위한 local repository로 생성

#### 생성된 local repository에 git-hub접속 정보 추가

##### 공용 또는 여러사람이 사용하는 컴퓨터인 경우 폴더별로 사용자를 변경하고자 할때 
1. git config --local user.name userId
2. git config --local user.email user@user.com

##### 혼자 사용하는 컴퓨터에서는 글로벌로 설정값을 저장
1. git config --local user.name userId
2. git config --local user.email user@user.com
3. git config 를 global로 설정하게 되면, local repository를
	생성할때마다 git config를 실행하지 않아도 된다.

### remote repository 정보 추가
1. git-hub 사이트에 접속하여 new repository를 설정
2. git remote add origin https://github.com/skynate22/Biz_506_2020_07_DBMS.git
	: remote repository 추가
3. git hub의 remote repository인 git remote add origin https://github.com/skynate22/Biz_506_2020_07_DBMS.git 이주소를 origin 이라는 이름으로 사용하겠다.

### git-hub에 프로젝트 올릴때, 올릴때 마다 항상 실행해야 한다.
1. git add . : 현재폴더, sub 폴더의 모든 파일을 local repository(git 폴더)에 압축, 헤쉬하여 저장하라
2. git commit -m "Comment" : 지금 시점에 추가된 프로젝트를 Comment라는 설명을 부착하여 remote에 올릴 준비를 하라
3. git push -u origin master : master(local)에 저장된 프로젝트를 origin(remote)에 보내라
4. git push : 최초에 push할때는 git push -u origin master라고 
명령을 수행해야 하는데, 두번째 이후 부터는 git push 라고만 명령을 내리면 된다.

### git-hub에 올려진 프로젝트를 학원, 집에서 공동으로 작업을 할경우
1. 학원에서 코딩한 후 프로젝트를 add, commit, push 하여 upload
2. 집에서 git clone 리모트 주소 하여 downLoad
3. 집에서 프로젝트 코딩 추가, 변경
4. 집에서 git config 수행, 이때 처음 수행한 user.name, user.email과 같게 해야한다.
5. 집에서 git push -u origin master
6. 학원에 오면 제일먼저 할일이 "git pull"을 수행하여 집에서 업로드한
	프로젝트와 학원 프로젝트를 동기화 시켜야 한다.
7. 학원에서 코딩 추가, 변경 한후 반복작업
8. 혹시 github.com에서 코드를 변경하거나 , 어떤 작업을 수행 했으면 반드시!!!!!
	로컬에서 git pull을 수행하자, 이것을 무시하면 remote repository를 지우고 다시만들 어야 하는
	경우가 발생할 수 있다.

### sys 사용자 접속 설정
1. 오라클 DBMS SW를 설치하면 기본적으로 DB Administer 사용자가
	등록이 되어 있다.	
2. System DBA : 오라클 DBMS를 관리하는 최상위 등급의 사용자
3. id 가 sys user : SQL Developer를 통해서 오라클 DBMS에 접속하여
Schema, User, Table 등을 생성하거나 삭제할수 있는 권한을 가진 사용자
4. sys user는 오라클 DBMS를 설치할떄 설정한 비밀번호로 접속을 할 수 있다.


### 오라클 사용자 생성
1. sys 로 접속하여 SQL 실습, 개발, 운용을 하는 것은 보안상, 안정상
매우 좋지 않다.
2. 일반적으로 사용자를 등록하고, 그 사용자 ID로 접속하여 명령을
수행하는 것이 좋다.

### 오라클의 사용자 생성 절차
1. 사용자 관할(관리할) TableSpace를 생성한다.
2. User를 생성하면서 TableSpace를 default로 지정해 준다.
3. 오라클에서는 새로운 사용자를 등록하면 아무것도 할수 없는 상태로 ID만 생성을 하게된다
4. 새로운 사용자가 DB에 접속하여 무엇인가 업무를 수행하려면 관리자(sys)가 새로운 
	사용자에게 권한을 부여해 주어야한다.


### NULL 값
* 프로그램 코딩이나, DBMS 에서 사용된 NULL 값
* 문자열형 : 공백, 빈칸 처럼 보이지는 않지만 Code값으로 인식되는 
			데이터와 구분하기 위해서 사용하는 "아무것도 아닌 값 이라는 개념"
* String s = "",String s = "", String s = null
* DB에서 Null 값은 칼럼에 데이터가 추가되지 않은 상태
* insert를 수행하면서 해당 칼럼의 데이터를 지정하지 않았을때

* DBMS PK로 지정된 칼럼이나, NOT NULL로 지정된 칼럼은 데이터를 지정하지 않은 상태로 
	INSERT 명령을 수행할수 없다.

## DataBase Language
1. DB Lang. 에는 DDL, DML, DCL 명령 세트가 있다.
2. DDL(Data definition Lang.) : CREATE ,DROP, ALTER
3. DML(Data Maniplation Lang.) : INSERT, SELECT, UPDATE, DELETE
4. DCL(Data Control Lang.) : GRANT, REVOKE, COMMIT, ROLLBACK