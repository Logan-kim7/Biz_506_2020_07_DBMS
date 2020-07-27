--여기는 시험준비 공간입니다.

CREATE TABLE test_student(
        st_num  NUMBER(5)  PRIMARY KEY,
        st_name nVARCHAR2(20) NOT NULL,
        st_tel  VARCHAR2(20),
        st_addr nVARCHAR2(125),
        st_grade NUMBER NOT NULL,
        st_dcode NUMBER(3),
        st_dept nVARCHAR2(10),
        st_prof nVARCHAR2(20)
);

SELECT * FROM test_student;

CREATE TABLE test_dept(
        d_code  NUMBER(3),
        d_name  nVARCHAR2(10),
        d_prof  nVARCHAR2(10)
);

SELECT * FROM test_dept;

CREATE TABLE test_score(
        sc_num NUMBER NOT NULL,
        sc_sub nVARCHAR2(20) NOT NUll,
        sc_score NUMBER(3) DEFAULT 0
);

SELECT * FROM test_score;

CREATE TABLE  test_sub(
        s_code CHAR(3),
        s_sub nVARCHAR2(20)
);



SELECT * FROM test_sub;

INSERT INTO test_sub (s_sub, s_code)
VALUES ('국어','s01');

INSERT INTO test_sub (s_sub, s_code)
VALUES ('영어','s02');

INSERT INTO test_sub (s_sub, s_code)
VALUES ('수학','s03');

INSERT INTO test_sub (s_sub, s_code)
VALUES ('음악','s04');

INSERT INTO test_sub (s_sub, s_code)
VALUES ('미술','s05');

INSERT INTO test_sub (s_sub, s_code)
VALUES ('소프트웨어공학','s06');

INSERT INTO test_sub (s_sub, s_code)
VALUES ('데이터베이스','s07');

SELECT * FROM test_sub;

DROP TABLE test_sub;

SELECT st.st_dcode, st.st_num,
        SUM(DECODE(SC.sc_sub,'국어',SC.sc_score,0)) AS 국어,
        SUM(DECODE(SC.sc_sub,'영어',SC.sc_score,0)) AS 영어,
        SUM(DECODE(SC.sc_sub,'수학',SC.sc_score,0)) AS 수학,
        SUM(DECODE(SC.sc_sub,'음악',SC.sc_score,0)) AS 음악,
        SUM(DECODE(SC.sc_sub,'미술',SC.sc_score,0)) AS 미술,
        SUM(DECODE(SC.sc_sub,'데이터베이스',SC.sc_score,0)) AS 데이터베이스,
        SUM(DECODE(SC.sc_sub,'소프트웨어공학',SC.sc_score,0)) AS 소프트웨어공학,
        
        
        SUM( DECODE(SC.sc_sub,'국어',SC.sc_score,0)+
        DECODE(SC.sc_sub,'영어',SC.sc_score,0)+
        DECODE(SC.sc_sub,'수학',SC.sc_score,0)+
        DECODE(SC.sc_sub,'음악',SC.sc_score,0)+
        DECODE(SC.sc_sub,'미술',SC.sc_score,0)+
        DECODE(SC.sc_sub,'데이터베이스',SC.sc_score,0)+
        DECODE(SC.sc_sub,'소프트웨어공학',SC.sc_score,0)) AS 총점,
        
       ROUND(SUM( DECODE(SC.sc_sub,'국어',SC.sc_score,0)+
        DECODE(SC.sc_sub,'영어',SC.sc_score,0)+
        DECODE(SC.sc_sub,'수학',SC.sc_score,0)+
        DECODE(SC.sc_sub,'음악',SC.sc_score,0)+
        DECODE(SC.sc_sub,'미술',SC.sc_score,0)+
        DECODE(SC.sc_sub,'데이터베이스',SC.sc_score,0)+
        DECODE(SC.sc_sub,'소프트웨어공학',SC.sc_score,0))/7,2) AS 평균


       
FROM test_sudent ST
    LEFT JOIN test_score SC
        ON ST.st_num = SC.sc_num
GROUP BY ST.st_num, st.st_dcode
ORDER BY st.st_num;



--건우형 방법 
SELECT *
FROM(
SELECT sc_num, st_num, st_tel, st_grade, st_dcode, st_prof,SC.sc_score, sc_sub
FROM test_score SC
    LEFT JOIN test_sudent ST
        ON st.st_num = sc_num
)
PIVOT(
SUM(sc_score)
for
sc_sub in('국어','영어','수학','음악','미술','데이터베이스','소프트웨어공학')
)
ORDER BY sc_num;
