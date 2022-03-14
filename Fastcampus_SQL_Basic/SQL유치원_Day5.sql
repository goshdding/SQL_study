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
실습
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

-- 4
