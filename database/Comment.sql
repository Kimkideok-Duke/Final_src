-- ====== Comment ========

-- 댓글(comment) 테이블
CREATE TABLE Comment_tb(
cno number PRIMARY KEY,
pno NUMBER,
FOREIGN KEY (pno) REFERENCES project (pno),
sno NUMBER,
FOREIGN KEY (sno) REFERENCES schedule (sno),
content varchar2(50),
writer varchar2(20),
regdte DATE,
updte DATE
);


DROP TABLE Comment_tb;
SELECT * FROM Comment_tb;

-- 댓글 시퀀스 생성
CREATE SEQUENCE seq_comm
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_comm;


-- 파일(File) 테이블
CREATE TABLE File_tb(
cno NUMBER PRIMARY KEY,
fname  varchar2(150),
fpath varchar2(200)
);

SELECT * FROM File_tb;
DROP table File_tb;


SELECT sysdate-hiredate FROM emp;

SELECT floor((sysdate-hiredate)/365) || '년 전' FROM emp;
SELECT floor((sysdate-hiredate)) || '일 전' FROM emp;
SELECT floor(((sysdate-hiredate)-(floor((sysdate-hiredate))))*24) || '시간 전' FROM emp;
SELECT floor(((sysdate-hiredate)-(floor((sysdate-hiredate))))*24) || '분 전' FROM emp;


SELECT sysdate-hiredate
CASE WHEN sal >=   THEN '일 전'
WHEN sal >= 4000  THEN '분 후'
WHEN sal >= 3000 THEN '시간 전'
ELSE '방금 전'
END 타임라인
FROM emp;

SELECT * FROM emp;

SELECT sysdate FROM dual;
SELECT hiredate FROM emp;


