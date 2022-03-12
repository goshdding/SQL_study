create database pokemon;
use pokemon;
create table mypokemon(
	number int,
    name varchar(60),
    type varchar(60),
    height float,
    weight float,
    attack int,
    defense int,
    speed int
);

insert into mypokemon
values
	(10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
    (25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
    (26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
    (133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
    (152, 'chikorita', 'grass', 0.9, 6, 49, 65, 45)
;

-- Mission 1
select 123*456
;

-- Mission 2
select 2130/30
;

-- mission3
select '피카츄' as '포켓몬'
;

-- mission4
select * from mypokemon
;

-- 5
select name from mypokemon
;

-- 6
select name, height, weight from mypokemon;

-- 7
select distinct height from mypokemon;

-- 8
select name, attack * 2 as attack2 from mypokemon;

-- 9
select name as '이름' from mypokemon;

-- 10
select attack 공격력, defense 방어력 from mypokemon;

-- 11
select ceil(height*100) as 'height(cm)' from mypokemon;

-- 12 
select * from mypokemon
limit 1
;

-- 13 
select name '영문명', height '키(m)', weight '몸무게(kg)'
from mypokemon
limit 2
;

-- 14
select name, attack + defense + speed as total
from mypokemon
;

-- 15
select name, round(weight / (height)^2, 2) as BMI
from mypokemon
;