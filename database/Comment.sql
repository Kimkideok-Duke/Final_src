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


DROP TABLE Comment_tb;
SELECT * FROM Comment_tb;


CREATE SEQUENCE seq_comm
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
DROP SEQUENCE seq_comm;



-- 파일(File)
CREATE TABLE File_tb(
cno NUMBER PRIMARY KEY,
fname  varchar2(150),
fpath varchar2(200)
);

SELECT * FROM File_tb;
DROP table File_tb;

