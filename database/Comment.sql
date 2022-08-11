-- ====== Comment ========

SELECT * FROM project;
SELECT * FROM schedule;
SELECT * FROM account;

-- 댓글(comment)
CREATE TABLE Comment_tb(
cno number PRIMARY KEY,
sno NUMBER,
FOREIGN KEY (sno) REFERENCES schedule (sno),
userno varchar2(9),
FOREIGN KEY (userno) REFERENCES account (userno),
content varchar2(50),
writer varchar2(20),
regdte DATE,
updte DATE
);

DROP TABLE Comment_tb;
SELECT * FROM Comment_tb;

CREATE SEQUENCE seq_comm
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_comm;

-- Comment 샘플 데이터
INSERT INTO Comment_tb values(seq_comm.nextval,1,'E10000023','제출합니다','김길동',sysdate,sysdate);		
INSERT INTO Comment_tb values(seq_comm.nextval,1,'E10000024','집갈래요ㅜㅜ','김유신',sysdate,sysdate);		
INSERT INTO Comment_tb values(seq_comm.nextval,1,'E10000022','하기싫어요안할래요','서길동',sysdate,sysdate);			
			

SELECT cno,content,writer,regdte,updte FROM Comment_tb
ORDER BY updte desc;



-- 파일(File)
CREATE TABLE File_tb(
fname  varchar2(150) PRIMARY KEY,
cno NUMBER,
FOREIGN KEY (cno) REFERENCES Comment_tb (cno),
fpath varchar2(200),
);

SELECT * FROM File_tb;
DROP TABLE File_tb;
	
-- File 샘플 데이터
insert into  File_tb values(seq_comm.currval,'/path', '파일명');

SELECT s.*, f.fname 
FROM SMCOMMENT s , smFile f
WHERE s.CNO =f.CNO(+)
and s.cno = 4;


