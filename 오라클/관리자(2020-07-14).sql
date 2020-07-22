-- Comment :주석
/*

    여러줄 주석
    SQL 명령을 입력할때 명령이 끝났다라는 것을 알리기 위해 >> ; 입력
    
    Ctrl + Enter : 현재 커서가 있는곳으로 명령을 보내고 결과를 받기
    
    * << 모든 칼럼

*/
-- 현재 오라클에 접속된 사용자(sys)가 관리하는 table들이 있는데
-- tab 이라는 이름의 table정보를 가져와서 나에게 보여달라
-- 오라클의 tab table은 현재 접속된 사용자가 관리하는 
-- DB Object(객체)들의 정보를 저장, 보관하고 있는 table
SELECT * -- * 모든 칼럼
FROM tab;


--오라클 system 데이터 사전의 자세한 정보를 보관하는 table 

SELECT *
FROM ALL_ALL_TABLES;

-- SELECT 키워드는 FROM 절을 포함하는 명령문 형태로 작성을하며
-- DBMS가 보관하고 있는 데이터를 table 형식으로 보여달라 라는 명령어
-- DBMS의 DML(Database Manuplation Lang)중에서 
-- Read(조회)를 수행하는 명령
-- CRUD 중에서 R : Read, Retrive 를 수행하는 명령문

SELECT *
FROM 주소록;


-- SQL 명령문을 통해서 DB 객체를 만들고 삭제하고, 데이터를 추가, 변경, 삭제를 수행할텐데
-- sys 사용자로 접속을 하게 되면 중요한 정보를 잘못 삭제, 변경할 우려가 있기 때문에
-- 실습을 위해서 사용자를 생성하여 수행을 할것이다.

-- 사용자를 추가하는 순서
-- 1. table Space :데이터를 저장할 물리적 공간을 설정
-- 2. user : 사용자를 생성하고, 물리적 저장공간과 연결

--TableSpace 생성(Create)
-- TableSpace는 오라클에서 Data 를 저장할 물리적 공간을 설정하는 것
-- myTS : 앞으로 SQL을 통해서 사용할 TableSpace의 Alias(이름)
-- ' .../myTS.dbf'  : 저장할 파일이름
-- Size : 오라클에서는 성능의 효율성을 주기위해
--          일단 빈 공간을 일정부분 설정하게 된다.
--          크기는 최초에 저장할 데이터의 크기등을 계산하여 설계하고 설정한다.
--          너무 작으면, 효율성이 떨어지고, 너무 크면 불필요한 공간을 낭비한다.
--          오라클 xe(Express Edition)에서는 table Space의 최대 크기를 11G로 제한한다.
--           만약 Size 10G로 지정하고, 용량이 초과되어 AUTO NEXT로 추가가 되는경우
--           전체 Size가  11G를 넘어서면 오류가 나면서 더이상 데이터를 저장할수 없다.

-- Auto.. NEXT : 만약 초기에 지정한 Size공간에 데이터가 가득하면
-- 자동으로 용량을 늘려서 저장할수 있도록 만들어라

-- CREATE로 시작되는 명령문 : DDL(Data definiton Lang) : 데이터 선언, 생성(추가와는 다름)
CREATE TABLESPACE myTS    -- db 파일이름을 myTS로 해라
DATAFILE 'C:/bizwork/oralce_data/myTS.dbf' --  이 위치에 db파일을 저장을 해라
SIZE 1M AUTOEXTEND ON NEXT 500K; -- 사이즈는 1M(메가 바이트) 씩해라 혹시 부족하다면 500K(킬로바이트)씩 용량을 늘려라 
--   데이터를 저장하는 양을 조절을해 1회 저장을 할때 값을 데이터의 크기와 비슷하게 설정을 하게 된다면
--   굉장히 빠른 저장속도를 표현해 낼수 있다.
-- SIZE의 1M : 기본크기를 1024 * 1024 byte 크기로 지정하라 
-- Next 500K : 자동으로 확장(늘리기)를 1024 * 500크기로 설정
-- Next를 지정할때 500KB 라고 하지 않는다.




-- 질의 작성기에서 코드를 작성할때 약속
-- DBMS의 SQL 문은 특별한 일부의 경우를 제외하고 대소문자 구별을 하지않는다.
-- DBMS, SQL, 오라클과 관련된 키워드는 모두 대문자로 작성할것
-- 어떤 변수 값, 내용등은 소문자로 사용하며 
-- 특별히 대소문자를 구분해야 하는경우는 별도로 공지를 할 것

-- DROP : DDL 명령어 CREATE와 반대되는 개념의 명령문
-- DROP 명령은 데이터를 물리적으로 완전 삭제하는 개념이므로 매우 신중하게 사용해야 한다.
DROP TABLESPACE myTS    -- 이명령어만 적게되면 DB 안에서 만 삭제가 된다(myTS tableSpace를 삭제하면서)
INCLUDING CONTENTS AND DATAFILES -- 그러므로 실제 컨텐츠와 데이터 파일도 함께 삭제해야된다.(연관된 정보와 data file도 같이 삭제하고)
CASCADE CONSTRAINTS; -- (그리고 설정된 권한, 역할 등이 있으면 그들도 같이 삭제를 해라 )

-- 위에서 생성한 TableSpace를 관리하며, 데이터를 조작할 사용자를 생성
-- (정식버젼에서는 비밀번호를 1234로설정시 보안상문제때문에 설정이 되질않는다.)
CREATE USER user1 IDENTIFIED BY 1234    -- 사용자 ID(user1) 와 PW(1234) 를 설정한다 
DEFAULT TABLESPACE myTS;   -- 사용자를 tableSpace에 연동시켜줘야 보안상 문제가 안생긴다.
--DEFAULT TABLESPACE myTS 를 해주지 않으면 관리자로 연동이 되기때문에 보안상문제가 생길수 있다.

-- DCL : Data Control Lang.
-- 새로생성된 user1에게 권한을 부여하기
-- user1이 로그인만 할수 있도록 권한(역할)을 부여하라 CONNECT(로그인만 할수있는 권한, 접속이 되는지 안되는지 테스트용)
GRANT CONNECT to user1;
-- ueser1이 로그인 할수 있는 권한을 제거
REVOKE CONNECT FROM user1;

-- user1이 로그인을 수행하고, 최소한으로 데이터들을 관리할 수 있도록 권한을 부여
--RESOURCE : 오라클에서 USER에게 줄수 있는 권한중 상당히 많은 일을 수행할수 있는 권한
-- 현재 시스템에 설치된 모든 TableSpace를 대상으로 무제한(TableSpace가 허용하는범위) 저장이 가능한 권한
-- RESOURCE 권한은 , Standard, Enterprice DBMS(정식버젼)에서는 함부로 부여해서는 안된다.
-- CONNECT와 RESOURCE 권한을 부여하게 되면 거의 DBA 수준의 권한을  갖게 된다.
GRANT CONNECT,RESOURCE TO user1;

-- login 권한과 table을 생성할수 있는 권한
GRANT CONNECT,CREATE TABLE TO user1;
--login 권한, table 생성권한, 학생정보 테이블에 데이터를 추가할수 있는 권한
GRANT CONNECT,CREATE TABLE, INSERT TABLE 학생정보 TO user1;
--login, table 생성, 학생정보 추가, 학생정보 조회
GRANT CONNECT,CREATE TABLE, INSERT TABLE 학생정보, SELECT TABLE 학생정보 TO user1;
--권한을 세부적으로 부여하는 것은 실무상에서 매우 필요하며 중요한 일이다.
--하지만
-- 학습하는 입장에서 GRANT 부여하는데 너무 많은 노력을 보이면 피곤하니
-- xe 버젼에서는 사용자에게 DBA 권한을 부여하고, 실습을 수행한다.
GRANT DBA TO user1;
--권한의 등급 sysDBA(시스템포함 모든권한) >>> DBA(자기담당구역만) >> user
-- DBA 권한(Roll)은 SysDBA보다 한단계 낮은 권한 등급을 가지며
-- 일반적으로 자신이 생성한 Table 등 Object에만 접근하여 명령을 수행한다.
