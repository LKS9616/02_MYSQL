      -- WHERE
      -- 특정 조건에 맞는 레코드(데이터)만을 선택하는 데 사용된다.
      -- 방법이 다양하다.

      -- 같음(=) 연산자를 활용한 WHERE
      select
          menu_name,
          menu_price,
          orderable_status
      from -- 여기에 있는
          tbl_menu
      where -- 이 조건에 맞는
        orderable_status = 'Y';

/*
tbl_menu 테이브렝 있는 컬럼
menu_name, menu_price, orderable_status를 조회할건데,
단 menu_price가 13000인 데이터만 조회해줘.
*/
select
    menu_name,
    menu_price,
    orderable_status
from -- 여기에 있는
     tbl_menu
where -- 이 조건에 맞는
    menu_price = 13000;

-- 같지 않음(!=, <>) 연산자를 사용하는 WHERE
-- ColumnA !-

select
    menu_name,
    menu_price,
    orderable_status
from -- 여기에 있는
    tbl_menu
where -- 이 조건에 맞는
#    orderable_status != 'Y';
    orderable_status <> 'Y';

select
    menu_name,
    menu_price,
    orderable_status
from --
    tbl_menu
where --
    menu_price <= 20000;

-- AND 연산자와 함께 where 절 사용
-- 둘 중에 하나라도 false면 false, 둘 다 true 여야지 true
/*
true = 1; // false = 0
null : 값이 없다.
*/

-- true 가 되는 조건
select 1 and 1; -- true and true -> true

-- false가 되는 조건
select 1 and 0, 0 and 0, 0 and null;
-- null이 되는 조건
select 1 and null, null and null;
-- where에서의 and 조건은 두 조건을 모두 충족시키는 것을 조회한다.

select
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
    tbl_menu
where
    orderable_status = 'Y' and -- 주문가능여부가 'Y'이고
    category_code = 10; -- 카테고리 코드가 10인 데이터만 출력

    /*
    tbl_manu 테이블에 있는 menu_name, menu_price, category_code, orderable_status를 조회하는데,
    주문 가능 여부가 Y이고, 가격이 10000원 이하인 데이터 조회
    */
select
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
    tbl_menu
where
    orderable_status = 'Y' and
    menu_price <= 10000;

-- OR 연산자와 함께 WHERE 절 사용
-- true가 되는 조건
select 1 or 1, 0 or 1, 1 or null;
-- false가 되는 조건
select 0 or 0;
-- null이 될 조건
select 0 or null, null or null;

-- where에서의 or 조건
-- 두 조건 중 하나라도 충족하면 조회한다.
select
    menu_name,
    menu_price,
    category_code,
    orderable_status
from
    tbl_menu
where
    orderable_status = 'Y' or
    category_code = 12;

/*
AND 와 OR 연산의 우선순위
- AND가 OR보다 우선순위가 높다.
- OR 외 우선순위를 높이고 싶으면 () 소괄호를 이용한다.
*/
 -- 0 AND 0이 먼저 진행되므로 두번째 연산은 1 or 0이 된다. => 1
select 1 or 0 AND 0;
 -- 1 or 0이 먼저 연산되므로 두번째 연산 1 AND 0 => 0
select(1 or 0) and 0;

select
    *
from
    tbl_menu
where
    category_code = 4 or
    menu_price = 9000 and
    menu_code > 10;
-- 모든 컬럼들을 조회해 오는데, 카테고리 코드가 4이고,
-- BETWEEN 연산자를 사용한 where
select
    menu_name,
    menu_price,
    category_code
from
    tbl_menu
where
    menu_price >= 10000 and -- 메뉴 가격이 10000원 이상이고,
    menu_price <= 25000;     -- 메뉴 가격이 25000원 이하

/*
Between 연산자
- 경계값을 포함하고 사이의 값을 포함한다.
BETWEEN 사용법
[column_name] BETWEEN [A] and [B]
*/

select
    menu_name,
    menu_price,
    category_code
from
    tbl_menu
where
    menu_price between 10000 and 25000; -- 메뉴 가격이 10000이상 25000 이하

    -- between의 부정표현
    -- 경계값을 포함하지 않는다.

select
    menu_name,
    menu_price,
    category_code
from
    tbl_menu
where
    menu_price not between 10000 and 25000;
-- 메뉴 가격이 10000이상 25000 이사가 아닌 데이터만 조회

/*
LIKE 연산자
- 특정 패턴과 일치하는 행을 검색해준다.

패턴
- % : 0개 이상의 문자를 의미한다.
ex) '%apple%' 는 apple이 포함된 모든 문자열을 의미한다.

- _ : 1개의 문자를 나타낸다.
ex) 'a_k' 는 'a'로 시작하고 'k'로 끝나는 세글자 문자열을 의미한다.
*/
      select
          *
      from
          tbl_menu
      where
          menu_name like '민트___';

/*
menu에서 '갈치' 라는 단어가 들어간 메뉴를 찾아보세요
*/
      select
          *
      from
          tbl_menu
      where
          menu_name like '%갈치%';

-- LIKE 부정표현
      select
          *
      from
          tbl_menu
      where menu_name not like '%갈치%';

/*
IN 연산자
- 특정 열의 값이 지정된 목록 중 하나와 일치하는지 확인하는데 사용된다.

IN 사용법
[column_name] in (4, 5, 6, ...)
*/
      select
          menu_name,
          category_code
      from
          tbl_menu
      where
          category_code in (4, 5, 6);
      -- category_code가 (4,5,6) 목록중에 있는 데이터만 조회해줘


-- IN 연산자의 부정표현
      select
          menu_name,
          category_code
      from
          tbl_menu
      where
          category_code not in (4, 5, 6);
      -- category_code가 (4,5,6) 목록중에 없는 데이터만 조회해줘

/*
IS NULL 연산자
-- 값이 null 인지 아닌지를 확인하여 조회한다.
*/
      select
          category_code,
          category_name,
          ref_category_code
      from
          tbl_category
      where
          ref_category_code is null;
      -- ref_category_code가 null인 데이터만 조회해줘

-- IS NULL 연산자의 부정표현
      select
          category_code,
          category_name,
          ref_category_code
      from
          tbl_category
      where
          ref_category_code is not null;
-- ref_category_code가 null이 아닌 데이터만 조회해줘