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
			
			insert into calendar values(cal_seq.nextval,#{pno},#{sno},#{title},#{start},
			#{end},#{content},null,#{backgroundColor},#{textColor},
			#{allDay})
