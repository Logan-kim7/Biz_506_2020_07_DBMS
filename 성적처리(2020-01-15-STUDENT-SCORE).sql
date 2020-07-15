-- 여기는 grade 화면

----------------------------------
--성적일람표 출력
----------------------------------

-- 성적정보 Table(tbl_score)에는 학번과 각 과목별 점수가 저장되어 있다.
-- 학생정보 Table(tbl_student)에는 학번과 이름등이 저장되어 있다.
-- 성적일람표를 보고 싶은데, 학생의 학번과 이름이 포함된 리스트를 보고싶다.
-- 두개 Table, tbl_score, tbl_student 를 연동하여 리스트를 조회해야 한다.
-- 이러한 기법을 JOIN 이라고 한다.


SELECT *
FROM tbl_score
WHERE sc_num BETWEEN '20001' AND '20010';

-- 완전 JONI
-- sc_score table 에있는 학번의 정보는 반드시 st_sudent 있다 라는 
-- 전제하에 결과가 원하는 대로 나온다
-- FROM 다음에 JOIN할 Table을 나열하고 
-- WHERE 절에 두 테이블의 연결점 칼럼을 설정해주면 된다.

SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score, tbl_student
WHERE 
-- sc_num BETWEEN '20001' AND '20010' AND
sc_num =st_num;

-- OUTER JOIN
-- 성적Table에는 1~100까지 데이터가 있고
-- 학생Table에는 1~50까지만 데이터가 있다.
-- 이러한 상황에서 학생성적리스트를 확인하면서 학생정보와 연동하여
-- 보고싶을때  EQJOIN을 사용하게 되면 실제 데이터가 1 ~ 50까지만
-- 나타나는현상이 발생한다.
-- 이런 상황에서 성적Table의 데이터는 모두 확인하면서
-- 학생Table 있는 정보만 연결해서 보여주는 방식의 JOINE

DELETE FROM tbl_student
WHERE st_num > '20050';

SELECT * FROM tbl_student;

-- 두개의 데이터가 완전히 일치하면 상관이 없는데 
-- EQJOIN을 했을시 주된 항목의 데이터(tbl_student)가 50항목밖에 없으므로
-- 보조된 데이터의 항목(tbl_score)이 100건이 있다하더라도 주된 항목의 데이터의
-- 갯수만큼 출력이 되게된다.


-- EQ JOIN 

SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score, tbl_student
WHERE 
sc_num =st_num;

-- 처음에쓰던 EQJOIN 형식 위에것과 동일한 결과값을 얻을수있다.
SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score
    INNER JOIN tbl_student
         ON sc_num =st_num;



-- LEFT JOIN 
-- OUTER JOIN의 대표적으로 많이 사용하는 JOIN Query
-- 1. JOIN 키워드 왼쪽에는 모두 리스트업할 table을 위치시키고
-- 2. 이 table과 연동하여 정보를 보조적으로 가져올 table을 JOIN 다음에 위치
-- 3. 두 table의 연결점(key)를 ON 키워드 다음에 작성해 준다.

-- JOIN 왼쪽 table의 데이터를 모두 보여주고
-- 키값으로 오른쪽 table에서 값을 찾은후 
-- 있으면, PROJECTION에 나열된 칼럼 위치에 값을 표시하고
-- 만약 없으면 (null)이라고 표시한다.

-- 왼쪽테이블의 데이터가 잘입력되었나 검증하는 용도로 많이 사용되고
-- 아직 FK(외래키) 설정이 되지 않은 table 간에 정보를 리스트 업하는 용도로 사용이된다.

-- LEFT JOIN 왼쪽에 있는 테이블의 정보를 다보여주되 tbl_score에 있는 값이
--  tbl_student보다 값이 더많으면 null 값으로 보여줘라(왼쪽테이블 값 검증용으로도 사용)
SELECT sc_num, st_name, sc_kor, sc_eng, sc_math, sc_music, sc_art
FROM tbl_score
    LEFT JOIN tbl_student
        ON sc_num = st_num;
    
