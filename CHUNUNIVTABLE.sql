select * from TB_DEPARTMENT; --  학과테이블
select * from TB_STUDENT; -- 학생테이블
select * from TB_PROFESSOR; -- 교수테이블
select * from TB_CLASS; -- 수업테이블
select * from TB_CLASS_PROFESSOR; -- 수업교수테이블
select * from TB_GRADE; -- 학점테이블

select
    department_name,
    category
from tb_department;

select concat(department_name,'의 정원은 ', capacity,'명입니다.')
from tb_department;

select *
from tb_student
where department_no = 01
      and absence_yn = 'Y';
--      and student_name like '%-1%';

select
    student_name
from
    tb_student
where
    student_no in ('A513079', 'A513090', 'A513091', 'A513110', 'A513119');

select
    department_name,
    category
from
    tb_department
where
    capacity between 20 and 30;

select
    professor_name
from
    tb_professor
where
    department_no is null;

select
    *
from
    tb_student
where
    department_no is null;

select
    *
from
    tb_class
where
    class_no in ('C0405500', 'C0409000', 'C3745400', 'C0432500', 'C3051900', 'C3221500');

select
    distinct category
from
    tb_department;

select
    STUDENT_NO,
    STUDENT_NAME,
    STUDENT_SSN
from
    tb_student;







