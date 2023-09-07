/*CREATE A TABLE WITH TABLE NAME AS student_details*/

create table student_detail
(
student_id int not null,
student_name varchar(12),
university_name varchar(20),
student_marks int not null,
grade varchar(2) default 'A',
student_dob int,
)

/*DISPLAY THE CRETAED TABLE student_detail*/

select * from student_detail

/*ADD A NEW COLUMN TO THE EXISTING TABLE*/

Alter table student_detail add gender varchar(20)

/*ADD CONSTRAIT TO EXISTING TABLE*/

Alter table student_detail add constraint CK check(student_marks>'20')

Alter table student_detail add constraint PK primary key(student_id)

/*INSERT VALUES TO THE TABLE*/

insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(1,'arun','anna university',80,'A',1995)

/*DELETE A RECORD IN TABLE*/

delete from student_detail where student_id =1

/*INSERT A RECORD IN A TABLE*/

insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(1,'arun','anna university',92,'A',1995,10)

/*UPDATE A ROW IN THE TABLE*/

update student_detail
set gender ='male' where student_id =1

/*INSERT ROWS IN A TABLE*/
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(2,'bharath','trichy university',95,'A',1995,'male')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(3,'cindrella','amirta university',80,'B',1993,'female')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(4,'devi','bannari university',75,'C',1994,'female')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(5,'elango','anna university',88,'B',1996,'male')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(6,'fakhar','amirta university',95,'A',1995,'male')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(7,'gokila','trichy university',78,'C',1996,'female')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(8,'harsha','anna university',65,'D',1996,'female')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(9,'indra','bannari university',40,'F',1995,'male')
insert into student_detail(student_id,student_name,university_name,student_marks,GRADE,student_dob,gender)values(10,'james','anna university',30,'F',1993,'male')

/*TO LIST OUT ALL THE DATA IN THE TABLE*/

select * from student_detail

/*TO LIST A TABLE WHERE STUDENTS HAVE GRADE A*/

select * from student_detail
where grade ='A'

/*TO LIST OUT THE TABLE WITH student_marks as DESCENDING ORDER*/

select * from student_detail
order by student_marks desc

/*TO LIST OUT TOP 3 */

select top 3* from student_detail

/*TO LIST THE HIGHEST MARK OBTAINED*/

select max(student_marks) as highest_mark from student_detail


/*TO COUNT THE GENDER ND ITS TOTAL AND AVERAGE*/
/*GROUP BY IS ALWAYS ASSOCIATED WITH AGGREGATE FUNCTIONS LIKE COUNT,SUM,AVG,MIN,MAX*/

select gender,count(gender) as gender_count,sum(student_marks) as gender_total,avg(student_marks) as gender_average from student_detail
group by gender

/*HAVING CLAUSE IS USED BECAUSE WHERE KEYWORD CANNOT BE USED WITH AGGREGATE FUNCTIONS*/

select count(grade) as grade_count,grade from student_detail
group by grade
having grade='A'

/*TO LIST OUT DIFFERENT UNIVERSITY*/

select distinct university_name from student_detail

/*TO FIND OUT THE university_name WHICH STARTS WITH LETTER t*/

select * from student_detail
where university_name like 'a%'

/*university_name WHICH CONTAIN SECIFIC LETTER*/

select * from student_detail
where university_name like '%anna%'

/*TO FIND OUT THE university_name WHICH ENDS WITH LETTER a*/

select * from student_detail
where university_name like '%y'

/*university_name CONTAIN LETTERS BEFORE THE GIVEN LETTER*/

select * from student_detail
where university_name like '_____y%'

/*student_name CONTAIN LETTERS AFTER THE GIVEN LETTER*/

select * from student_detail
where student_name like '%b______'

/*student_name CONTAIN LETTERS WHICH STARTS WITH a AND ENDS WITH n*/

select * from student_detail
where student_name like 'a%n'

/*CREATE ANOTHER TABLE TO PERFORM JOIN OPERATIONS*/

create table result
(
roll_no int not null primary key,
result varchar(6) not null,
student_id int not null
)

/*TO ADD FOREIGN KEY TO COMBINE TWO INDIVIDUAL TABLE*/

alter table result
add foreign key (student_id)references student_detail(student_id)

/*INSERT VALUES INTO TABLE result*/

insert into result(roll_no,result,student_id)values(111,'pass',1)
insert into result(roll_no,result,student_id)values(112,'pass',2)
insert into result(roll_no,result,student_id)values(113,'pass',3)
insert into result(roll_no,result,student_id)values(114,'pass',4)
insert into result(roll_no,result,student_id)values(115,'pass',5)
insert into result(roll_no,result,student_id)values(116,'pass',6)
insert into result(roll_no,result,student_id)values(117,'pass',7)
insert into result(roll_no,result,student_id)values(118,'pass',8)
insert into result(roll_no,result,student_id)values(119,'fail',9)
insert into result(roll_no,result,student_id)values(120,'fail',10)

/*TO LIST OUT THE DATA IN result*/

select * from result

select result,count(result)as result_count from result
group by result

/*JOIN THE TWO TABLE*/

select student_detail.student_id,student_name,university_name,student_marks,gender,roll_no,result,result.student_id from student_detail
join result on result.student_id=student_detail.student_id

/*SELF JOIN*/
create table sfjoin
(
studentid int primary key,
studentname varchar(10),
teacherid int not null
)

/*INSERT VALUES FOR TABLE sfjn*/
insert into sfjoin(studentid,studentname,teacherid)values(1,'bharath',8)
insert into sfjoin(studentid,studentname,teacherid)values(2,'raj',7)
insert into sfjoin(studentid,studentname,teacherid)values(3,'vetri',6)
insert into sfjoin(studentid,studentname,teacherid)values(4,'vel',5)
insert into sfjoin(studentid,studentname,teacherid)values(5,'harshini',4)
insert into sfjoin(studentid,studentname,teacherid)values(6,'navi',3)
insert into sfjoin(studentid,studentname,teacherid)values(7,'dhaksh',2)
insert into sfjoin(studentid,studentname,teacherid)values(8,'pooja',1)

select * from sfjoin

/*SELF JOIN*/

select s.studentname as student_name,t.studentname as teacher_name
from sfjoin s
join sfjoin t on s.studentid = t.teacherid

/*STORED PROCEDURE
GROUP OF T-SQL STATEMENTS WHEN U NEED TO USER THE SAME QUERY AGAIN AND AGAIN U CAN SAVE IT AS A STORED PROCEDURE
AND CALL IT BY NAME*/

create procedure joint_table
as
begin
select student_detail.student_id,student_name,university_name,student_marks,gender,roll_no,result,result.student_id from student_detail
join result on result.student_id=student_detail.student_id
end

exec joint_table

/*VIEW
A SAVED SQL QUERY CONSIDERED AS A VIRTUAL TABLE
IT CONTAINS ROWS AN COLUMNS JUST LIKE A NORMAL TABLE AND THE FIELDS IN THIS TABLE ARE THE FIELDS AVAILABLE IN ONE OR MORE TABLE*/

create view pass_student
AS
select student_name,university_name,student_marks,gender,roll_no,result,result.student_id from student_detail
join result on result.student_id=student_detail.student_id
where result ='pass'

 /*CTE IS A TEMPORARY RESULT SET THAT CAN BE REFERENCED WITH A SINGLE SELECT,INSERT,UPDATE AND DELETE STATEMENT
THAT IMMEDIATELY FOLLOWS CTE*/

with student_marks
AS
(
select student_id,student_name,student_marks from student_detail
)

select student_name,student_marks,result from result
join student_marks on student_marks.student_id=result.student_id

/*SUBQUERIES*
QUERY WITHIN ANOTHER QUERY
SUBQUERY EXECUTES FIRST WHEN THERE IS NO CORELATION WITH MAIN QUERY
IT IS EMBEDDED IN WHERE CLAUSE OF ANOTHER SQL QUERY*/

select student_name ,university_name,grade from student_detail where student_id in (select student_id from result 
where result ='pass')

select student_name ,university_name,grade from student_detail where student_id not in (select student_id from result 
where result ='pass')

/*RANKING WINDOW FUNCTIONS*/

select * ,
row_number()over(order by grade) as row_no,
rank()over(order by grade) as rank_no,
dense_rank()over( order by grade) as dense_rank
from student_detail

select *,
row_number()over(partition by university_name order by grade) as row_no
from student_detail

select *,
rank()over(partition by university_name order by grade) as rank_no
from student_detail

/*TRIGGER*
THREE TYPES -DML,DDL AND LOGON

DML TRIGGERS FIRES AUTOMATICALLY IN RESPONSE TO DML EVENTS(INSERT,UPDATE AND DELETE)

DML TRIGGERS -AFTER TRIGGERS AND INSTEAD OF TRIGGER

AFTER TRIGGER -INSERT,DELETE,UPDATE STATEMENTS CAUSES AN AFTER TRIGGER TO FIRE AFTER THE RESPECTIVE
STATEMENTS COMPLETE EXECUTION

INSTEAD OF TRIGGER -INSERT,DELETE,UPDATE STATEMENTS CAUSES INSTAED OF TRIGGER TO FIRE INSTAED OF RESPECTIVE STATEMENT EXECUTION*/

create trigger student_id
on student_detail
for insert
as 
begin

declare @student_id int
select @student_id =student_id from inserted
insert into result(roll_no,result,student_id)VALUES(121,'pass',11)
end

select * from student_detail
select * from result

insert into student_detail(student_id,student_name,university_name,student_marks,grade,student_dob,gender)values(11,'dhaksh','bannari university',95,'A',1995,'male')











