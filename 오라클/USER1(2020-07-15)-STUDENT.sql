-- 
SELECT st_dept FROM tbl_student
GROUP BY st_dept;




CREATE TABLE tbl_student (
        st_num	CHAR(5)	PRIMARY KEY,		
        st_name	nVARCHAR2(20) NOT NULL,		
        st_dept	CHAR(4),			
        st_grade	NUMBER(1),			
        st_tel	VARCHAR2(20),			
        st_addr	nVARCHAR2(125)	,		
        st_age	NUMBER(3)			

);

DROP TABLE tbl_student;
DROP TABLE tbl_dept;

SELECT * FROM tbl_student;

CREATE TABLE tbl_dept(
        d_code CHAR(4) PRIMARY KEY,
        d_name nVARCHAR2(20) NOT NULL UNIQUE,
        d_prof NVARCHAR2(20) 
);

INSERT INTO tbl_dept (d_name, d_code) VALUES ('관광학', 'D001');
INSERT INTO tbl_dept (d_name, d_code) VALUES ('국어국문', 'D002');
INSERT INTO tbl_dept (d_name, d_code) VALUES ('법학',	'D003');
INSERT INTO tbl_dept (d_name, d_code) VALUES ('전자공학', 'D004');
INSERT INTO tbl_dept (d_name, d_code) VALUES ('컴퓨터공학', 'D005');

SELECT * FROM tbl_dept;

SELECT st_num, st_name, st_dept, st_grade
FROM tbl_student
WHERE st_num BETWEEN '20001' AND '20010';

CREATE TABLE tbl_score(
        sc_num	CHAR(5)	PRIMARY KEY,	
        sc_kor NUMBER(3),			
        sc_eng	NUMBER(3),			
        sc_math	NUMBER(3),			
        sc_music NUMBER(3),			
        sc_art	NUMBER(3)			
);

SELECT sc_num, st_name, st_dept, d_name, sc_kor, sc_eng
FROM tbl_score
    LEFT JOIN tbl_student
        ON sc_num = st_num
    LEFT JOIN tbl_dept
        ON st_dept = d_code
WHERE sc_num BETWEEN '20001' AND '20010';











