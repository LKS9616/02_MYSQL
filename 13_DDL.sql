-- DDL(Data Definition Language)
-- 데이터 정의어, 데이터베이스를 정의하는 언어
-- 테이블을 생성, 수정, 삭제하는 등의 데이터 전

drop table if exists tbl_country, tbl_test, user_check, user_foreignkey1, user_grade, user_notnoll, user_primarykey, user_unique, user_notnull, test_table
;
-- create : 데이터베이스, 테이블 등을 생성
-- alter : 테이블을 수정
-- drop : 데이터베이스, 테이블을 삭제
-- truncate : 테이블을 초기화

-- CREATE
-- 테이블을 생성하는 구문(데이터베이스도 가능)
-- if not exists : 존재하지 않으면 수행
-- -> 기존에 존재하는 테이블이 있더라도 에러가 발생하지는 않는다

create table if not exists tb4
(
    pk int primary key,
    fk int,
    col1 varchar(255) default 'MYSQL',
    check(col1 in ('Y', 'N'))
);

-- 테이블 구조 확인
describe tb4;

insert into tb4 values (1, 10, 'Y');

select * from tb4;

-- AUTO INCREMENT
-- insert 시 primary 키에 해당하는 칼럼에 자동으로 번호를 발생(중복되지 않게)

create table if not exists tb5
(
    pk int auto_increment primary key,
    fk int,
    col1 varchar(255) default 'MYSQL',
    check(col1 in ('Y', 'N'))
);

describe tb5;

insert into tb5 values (null, 10, 'Y');

select * from tb5;

-- ALTER
-- 테이블에 추가/변경/수정/삭제를 할 수 있다.

describe tb5;
-- 열 추가
alter table tb5
    add col2 int not null;

alter table tb5
    drop column col2;

alter table tb5
    change column fk change_fk int not null;

-- 열 제약 조건 추가, 삭제
alter table tb5
    drop primary key;

-- modify 컬럼의 정의를 바꾸는 것
alter table tb5
    modify pk int;

alter table tb5
    add primary key(pk);

select * from tb5;

-- 기존 데이터가 있는 경우, not null 옵션의 컬럼이 생기면
-- 기본값으로 들어가게 됨
-- [22001][1292] Data truncation: Incorrect date value: '0000-00-00' for column 'col3' at row 1


alter table tb5
    add col3 date not null;
    # add col4 date not null;

-- mysql 자체에서 전역적인 유효성 검사 모드를 사용한다.
-- ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,
-- ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION
select @@global.sql_mode;

set global sql_mode = ' ';

-- DROP
-- 테이블을 삭제하기 위한 구룬
-- if exist를 적용하면 존재하지 않는 테이블이라도 에러가 발생하지 않는다.

create table if not exists tb3
(
    pk int auto_increment primary key,
    fk int,
    col1 varchar(255) default 'MYSQl',
    check(col1 in ('Y', 'N'))
);

drop table if exists tb1, tb2, tb3;

-- TRUNCATE
-- 삭제할 때 사용된다.
-- delete -> 데이터를 삭제할 때 행마다 하나씩 지워진다.
-- truncate -> 테이블 drop, 테이블 생성 진행
-- auto increment 컬럼이 있는 경우 시작값도 0으로 초기화된다.

create table if not exists tb6
(
    pk int auto_increment primary key,
    fk int,
    col1 varchar(255) default 'MYSQl',
    check(col1 in ('Y', 'N'))
);

insert into tb6 values(null, 10, 'Y');
insert into tb6 values(null, 10, 'Y');
insert into tb6 values(null, 10, 'Y');
insert into tb6 values(null, 10, 'Y');

truncate tb6;