-- ====== Timeline ========

-- 타임라인 테이블
CREATE table Timeline(
tno NUMBER PRIMARY KEY,
pno NUMBER,
sno NUMBER,
writer varchar2(20),
tdte DATE,
state varchar2(50)
);
SELECT * FROM Timeline;
DROP TABLE Timeline;

-- 타임라인 시퀀스 생성
CREATE SEQUENCE seq_time
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_time;



