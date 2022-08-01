CREATE TABLE PROJECT (
    pno NUMBER PRIMARY KEY,
    title varchar2(50) NOT NULL,
    team varchar2(50) NOT NULL,
    userno varchar2(9) NOT NULL
);

CREATE SEQUENCE seq_pno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;

INSERT INTO account values('E'||to_char(acc_seq.nextval),'qwerty123','김길동','himan1234@naver.com',
	'차장','서울시 마포구 서교동 447-5 201호','010-1234-5678',NULL,sysdate,'pm');


INSERT INTO PROJECT values(seq_pno.nextval, '첫프로젝트', '개발부', 'E10000004');
SELECT * FROM PROJECT;

CREATE TABLE SCHEDULE(
	sno NUMBER PRIMARY KEY,
	pno NUMBER NOT NULL,
	sname varchar2(50) NOT NULL,
	progress NUMBER NOT NULL,
	startDate DATE NOT NULL,
	endDate DATE
);
CREATE SEQUENCE seq_sno
			INCREMENT BY 1
			START WITH 1
			MAXVALUE 9999;
INSERT INTO SCHEDULE values(seq_sno.nextval, 2, '첫일정', 0, sysdate, NULL);
SELECT * FROM SCHEDULE;

CREATE TABLE PARTICIPANT (
	userno varchar2(9) NOT NULL,
	sno NUMBER NOT NULL,
	pno NUMBER NOT NULL
);
DROP TABLE PARTICIPANT;
INSERT INTO PARTICIPANT values('E10000004', 2, 2);
SELECT * FROM PARTICIPANT;

