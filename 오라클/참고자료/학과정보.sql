



USE myDB
-- 만약 tbl_dept가 있으면 삭제하고 다시 만들어라
DROP TABLE IF EXISTS TBL_DEPT;
-- 테이블이 없으면 만들어라 
CREATE TABLE IF NOT EXISTS TBL_DEPT(
		d_code CHAR(4) PRIMARY KEY,
		D_name VARCHAR(30) NOT NULL,
		D_prof VARCHAR(30)

		);
Insert into USER1.TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('D001','관광정보학','홍길동');
Insert into USER1.TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('D002','국어국문','이몽룡');
Insert into USER1.TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('D003','법학','성춘향');
Insert into USER1.TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('D004','전자공학','임꺽정');
Insert into USER1.TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('D005','컴퓨터공학','장영실');
Insert into USER1.TBL_DEPT (D_CODE,D_NAME,D_PROF) values ('D006','무역학','장길산');
