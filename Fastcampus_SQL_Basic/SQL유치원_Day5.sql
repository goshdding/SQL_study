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