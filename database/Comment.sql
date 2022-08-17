-- ====== Comment ========

SELECT * FROM project;
SELECT * FROM schedule;
SELECT * FROM account;

-- 댓글(comment)
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


CREATE TABLE Timeline(
tno NUMBER PRIMARY KEY,
pno NUMBER REFERENCES project (pno),
timedte date
);

SELECT * FROM Timeline;
DROP TABLE Timeline;

CREATE SEQUENCE seq_timeline
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
		DROP SEQUENCE seq_timeline;
		
INSERT INTO Timeline values(seq_timeline.nextval,2,3,sysdate);

SELECT * FROM project;
SELECT * FROM SCHEDULE;
SELECT * FROM COMMENT_TB;

	SELECT s.sname,t.timedte,c.WRITER,c.CNO
	FROM 
	SCHEDULE s,Timeline t,COMMENT_TB c
	WHERE s.pno = t.pno
	AND 
	
	
	SELECT s.sname,t.timedte
	FROM 
	SCHEDULE s,Timeline t
	WHERE s.pno = t.pno;


SELECT * FROM SCHEDULE;
SELECT * FROM PROJECT;
SELECT * FROM COMMENT_TB;
SELECT * FROM Timeline;

SELECT * FROM SCHEDULE s,comment_tb c,Timeline t
WHERE s.


SELECT s.sname,t.timedte FROM SCHEDULE s, Timeline t
WHERE s.pno= t.pno; 

SELECT c.cno,c.writer,t.timedte FROM comment_tb c, Timeline t
WHERE c.sno= t.sno; 

SELECT * FROM (SELECT s.sname,tt.timedte FROM SCHEDULE s, Timeline tt
WHERE s.pno= tt.pno) scTm,(SELECT c.cno,c.writer,t.timedte FROM comment_tb c, Timeline t
WHERE c.sno= t.sno) cmTm;

SELECT * FROM COMMENT_TB;


SELECT * FROM Timeline;

SELECT s.SNAME,t.timedte FROM SCHEDULE s,timeline t
WHERE s.pno=t.pno;

SELECT s.pno,s.SNAME,c.CNO ,c.WRITER,c.REGDTE  FROM comment_tb c FULL OUTER JOIN SCHEDULE s ON (s.sno=c.sno);


SELECT * FROM comment_tb;
INSERT INTO Timeline values(seq_timeline.nextval,2,sysdate);
SELECT * FROM SCHEDULE;

SELECT * FROM account;

SELECT s.pno,s.SNAME,c.CNO ,c.WRITER,c.REGDTE,c.updte,c.sno 
FROM comment_tb c FULL OUTER JOIN SCHEDULE s ON (s.sno=c.sno)
WHERE s.pno=2;







