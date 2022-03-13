show databases;

use pokemon;
show tables;
show columns from mypokemon;

-- 1
select name from mypokemon;
select type from mypokemon where name = 'eevee';

-- 2
select name from mypokemon;
select attack, defense from mypokemon where name = 'caterpie';

-- 3
select * from mypokemon
where weight > 6
;

-- 4
select name
from mypokemon
where height > 0.5 and weight >= 6
;

-- 5
select name as weak_pokemon
from mypokemon
where attack < 50 or defense < 50
;

-- 6
select type from mypokemon
;
select *
from mypokemon
where type not like 'normal'
;
select *
from mypokemon
where not(type = 'normal')
;
select *
from mypokemon
where type not like 'normal'
;

-- 7
select name, type
from mypokemon
where type in ('normal', 'fire', 'water', 'grass')
;

-- 8
select name, attack
from mypokemon
where attack between 40 and 60
;
select name, attack
from mypokemon
where attack > 40 and attack < 60
;

-- 9
select name 
from mypokemon 
where name like '%e%'
;

-- 10
select *
from mypokemon
where name like '%i%' and speed <= 50
;

-- 11
select name, height, weight
from mypokemon
where name like '%chu'
;

-- 12
select name, defense
from mypokemon
where name like '%e' and defense < 50
;

-- 13
select name, attack, defense
from mypokemon
where abs(attack - defense) >= 10
;

-- 14 
select name, (attack+defense+speed) as total
from mypokemon
where attack + defense +speed >= 150
;

select * from mypokemon;