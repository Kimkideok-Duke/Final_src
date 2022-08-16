SELECT * FROM project;

SELECT * FROM SCHEDULE;
			create table calendar(
				id number primary key,
				pno NUMBER,
				sno NUMBER,
				title varchar2(100),
				start1 varchar2(50),
				end1 varchar2(50),
				content varchar2(500),
				bordercolor varchar2(20),
				backgroundcolor varchar2(20),
				textcolor varchar2(20),
				allday number(1)
			);
			create sequence cal_seq
				start with 1
				minvalue 1;
			DROP TABLE 
			insert into calendar values(cal_seq.nextval, 1, 2, '두일정등록','2022-08-21',
				'2022-08-29','내용','navy','pink','yellow',1);
		

SELECT * FROM CALENDAR c ;

UPDATE calendar
    SET title = 'test(2203)',
        START1 = '2022-09-17T15:00:00.000Z', 
        end1 = '2022-09-18T15:00:00.000Z',
        content = 'test(2203)',
        backgroundcolor='navy',
        textcolor='pink',
        allday=1
WHERE id = 5

SELECT sno
FROM calendar
WHERE id = 5;

SELECT s.*
FROM calendar c, schedule s
WHERE c.id = 5
AND c.sno = s.sno; 



