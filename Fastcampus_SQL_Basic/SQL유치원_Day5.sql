use pokemon;
select number, name
from mypokemon
order by number desc
;
select number, name, attack, defense
from mypokemon
order by attack desc, defense
;
select number, name, attack, defense
from mypokemon
order by 3 desc, 4
;
/*
데이터 순위 
rank() over(order by)
= dense_rank() over(order by) 
= row_number() over(order by)
*/
-- RANK
-- 공동 순위가 있으면 다음 순서로 건너 뜀
-- e.g. 1 > 2 > 2 > 4 > 5
select name, attack,
	   rank() over(order by attack desc) as attack_rank
from mypokemon
;
-- DENSE_RANK
-- 공동 순위가 있어도 다음 순서 이어서 순위 매김
-- e.g. 1 > 2 > 2 > 3 > 4
select name, attack,
	   dense_rank() over(order by attack desc) as attack_rank
from mypokemon
;
-- ROW_NUMBER
-- 공동 순위 없음
-- e.g. 1 > 2 > 3 > 4 > 5
select name, attack,
	   row_number() over(order by attack desc) as attack_rank
from mypokemon
;
-- 각 순위 함수 비교
select name, attack,
	   rank() over(order by attack desc) as rank_rank,
	   dense_rank() over(order by attack desc) as rank_dense_rank,
	   row_number() over(order by attack desc) as rank_row_number
from mypokemon
;


/*
실습 1
*/
DROP DATABASE IF EXISTS pokemon;
CREATE DATABASE pokemon;
USE pokemon;
CREATE TABLE mypokemon (
number INT,
name VARCHAR(20),
type VARCHAR(10),
attack INT,
defense INT,
capture_date DATE
);
INSERT INTO mypokemon (number, name, type, attack, defense, capture_date)
VALUES (10, 'caterpie', 'bug', 30, 35, '2019-10-14'),
(25, 'pikachu', 'electric', 55, 40, '2018-11-04'),
(26, 'raichu', 'electric', 90, 55, '2019-05-28'),
(125, 'electabuzz', 'electric', 83, 57, '2020-12-29'),
(133, 'eevee', 'normal', 55, 50, '2021-10-03'),
(137, 'porygon', 'normal', 60, 70, '2021-01-16'),
(152, 'chikoirita', 'grass', 49, 65, '2020-03-05'),
(153, 'bayleef', 'grass', 62, 80, '2022-01-01');

-- Mission 1
use pokemon;
select name, length(name)
from mypokemon
order by 2
;

-- 2
select name, 
	   rank() over(order by defense desc) as defense_rank
from mypokemon
;

-- 3
select * from mypokemon;
select name, datediff(capture_date, '2022-02-14') as days
from mypokemon
;

/*
실습 2
*/
-- 1
use pokemon;

select right(name, 3) last_char
from mypokemon
;

-- 2
select left(name, 2) left2
from mypokemon
;

-- 3
select replace(name, 'o', 'O') bigO 
from mypokemon
where name like '%o%'
;

-- 4
select name, upper(concat(left(type, 1), right(type,1))) as type_code
from mypokemon
;

-- 5
select *
from mypokemon
where length(name) > 8
;

-- 6
select round(avg(attack), 0) avg_of_attack
from mypokemon
;

-- 7
select floor(avg(defense)) avg_of_defense
from mypokemon
;

-- 8
select name, power(attack, 2) as attack2
from mypokemon
where length(name) < 8
;

-- 9
select name, (attack % 2) as div2
from mypokemon
;
select name, mod(attack, 2) as div2
from mypokemon
;

-- 10
select name, abs(attack - defense) as diff
from mypokemon
where attack <= 50
;

-- 11
select date(now()) now_date, time(now()) now_time
;
select current_date() now_date, current_time() now_time
;

-- 12
select name, month(capture_date) month_num, monthname(capture_date) month_eng
from mypokemon
;

-- 13
select dayofweek(capture_date) day_num, dayname(capture_date) day_eng
from mypokemon
;

-- 14
select year(capture_date) year, month(capture_date) month, day(capture_date) day
from mypokemon
;