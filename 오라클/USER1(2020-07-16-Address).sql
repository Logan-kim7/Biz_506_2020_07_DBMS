-- user1 화면

CREATE TABLE tbl_address(

ad_seq	CHAR(5) PRIMARY KEY	,
ad_name	nVARCHAR2(20)	NOT NULL,		
ad_tel	nVARCHAR2(20),			
ad_addr	nVARCHAR2(125)			
);


CREATE TABLE tbl_hobby(
        ad_seq	CHAR(5)	NOT NULL,
        ho_name	nVARCHAR2(20)	NOT NULL
				

);

SELECT * FROM tbl_address;
-------------------------------------------------------------------------------
-- 두개의 테이블(주소, 취미)이 1:N(다)의 관계가 있는 상태
-------------------------------------------------------------------------------
-- 보조테이블에 있는 데이터가 주 테이블에 PK값을 다수 가지고 있는 경우
-- 두 테이블을 조인하면, 보조테이블의 레코드 개수만큼
-- 주테이블의 데이터가 더 추가된 것처럼 보인다.
SELECT *
FROM tbl_address AD
    LEFT JOIN tbl_hobby HO
        ON AD.ad_seq = HO.ad_seq
ORDER BY ad_name;



/*
등산
낚시
여행
독서
음악감상
묵묵부답
기타
노래
음주
가무

*/

-- if(ho_name == '등산'){
-- return 'O';
-- }else{
--      return ' ';
--}

-- str = ho_name == '등산' ? 'O' : ' ';




--ho_name == '등산' 이면
-- O문자열을 보여라
-- 아니면 공백 문자열을 보여라
SELECT DECODE(ho_name, '등산','O',' ')
FROM tbl_hobby;

--ad_seq 값은 한사람이 여러가지 취미를 가지고 있으면
-- 같은 ad_seq가진 레코드가 다수 나타나게 된다.
-- A0001 등산
-- A0001 낚시
-- 이러한 형태의 리스트가나타날텐데
-- 우리는 ad_seq값을 그룹으로 묶고
-- 취미부분을 가상의 칼럼으로 변환하여
-- A0001 등산     낚시 
-- 형식의 리스트로 보이기 위한 방법
-- 이러한 형식의 데이터를 리스트업 하는 것은 PIVOT 이라고 한다.
(
SELECT ad_seq,
                 MAX( DECODE(ho_name,'등산', 'O',' ') ) AS 등산,
                 MAX( DECODE(ho_name,'낚시','O',' ') ) AS 낚시,
                 MAX( DECODE(ho_name,'여행','O',' ') ) AS 여행,
                 MAX( DECODE(ho_name, '독서','O', ' ') ) AS 등산,
                 MAX( DECODE(ho_name, '음악감상','O',' ') ) AS 음악감상,
                 MAX( DECODE(ho_name,'묵묵부답', 'O', ' ') ) AS 묵묵부답,
                 MAX( DECODE(ho_name, '기타','O',' ') ) AS 기타,
                 MAX( DECODE(ho_name,'노래','O',' ') ) AS 노래,
                 MAX( DECODE(ho_name, '음주','O',' ') ) AS 음주,
                 MAX( DECODE(ho_name, '가무','O',' ') ) AS 가무,
    
FROM tbl_hobby
WHERE hb_name IS NOT NULL
GROUP BY ad_seq
ORDER BY ad_seq;
);

SELECT AD._seq, AD.ad_name, HO.*
FROM tbl_address AD
    LEFT JOIN tbl_hobby HO
        ON


DROP TABLE tbl_hobby;