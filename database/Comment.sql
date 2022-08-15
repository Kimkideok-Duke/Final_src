-- ====== Comment ========

SELECT * FROM project;
SELECT * FROM schedule;
SELECT * FROM account;

-- 댓글(comment)
CREATE TABLE Comment_tb(
cno number PRIMARY KEY,
sno NUMBER,
FOREIGN KEY (sno) REFERENCES schedule (sno),
content varchar2(50),
writer varchar2(20),
regdte DATE,
updte DATE
);

userno varchar2(9),
FOREIGN KEY (userno) REFERENCES account (userno),

DROP TABLE Comment_tb;
SELECT * FROM Comment_tb;

CREATE SEQUENCE seq_comm
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_comm;

-- Comment 샘플 데이터
INSERT INTO Comment_tb values(seq_comm.nextval,2,'E10000003','제출합니다','홍길동',sysdate,sysdate);		
INSERT INTO Comment_tb values(seq_comm.nextval,3,'E10000003','안녕하세요','홍길동',sysdate,sysdate);		
		
		SELECT * FROM account;

			

SELECT cno,content,writer,regdte,updte FROM Comment_tb
ORDER BY updte desc;



-- 파일(File)
CREATE TABLE File_tb(
fname  varchar2(150) PRIMARY KEY,
cno NUMBER,
FOREIGN KEY (cno) REFERENCES Comment_tb (cno) ON DELETE CASCADE,
fpath varchar2(200)
);

SELECT * FROM File_tb;
DROP table File_tb;
	
-- File 샘플 데이터
insert into  File_tb values('/path',seq_comm.currval, '파일명');
SELECT * FROM  FILE_TB;		

		SELECT * FROM comment_tb WHERE sno = #{sno}
		ORDER BY regdte DESC;
		
		SELECT * FROM account;
	
	SELECT * FROM SCHEDULE;
	SELECT * FROM project;

		SELECT
		title
		FROM project p, SCHEDULE s 
		WHERE s.PNO = p.PNO 
		AND sno = 4;