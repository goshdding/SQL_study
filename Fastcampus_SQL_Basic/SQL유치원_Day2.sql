create database pokemon;

/*
CREATE, INSERT 실습

Mission 1
pokemon DB 생성
mypokemon 테이블 생성, 데이터 삽입
*/

use pokemon;
create table mypokemon(
	number int,
    name varchar(20),
    type varchar(10)
);
insert into mypokemon(number, name, type)
values (10, "caterpie", "bug"),
	(25, "pikachu", "electric"),
    (133, "eevee", "normal");
select * from mypokemon;


/*
Mission 2
pokemon DB에 
mynewpokemon 테이블 추가
새로운 데이터 삽입
*/
create table mynewpokemon(
	number int,
    name varchar(20),
    type varchar(10)
);
insert into mynewpokemon(number, name, type)
values(77, "포니타", "불꽃"),
	(132, "메타몽", "노말"),
    (151, "뮤", "에스퍼");
select * from mynewpokemon;

show databases;


/*
ALTER, DROP 실습

Mission 1
RENAME, CHANGE COLUMN
*/
use pokemon;

alter table mypokemon rename myoldpokemon;
alter table myoldpokemon
change column name eng_nm varchar(20);
select * from myoldpokemon;

alter table mynewpokemon
change column name kor_nm varchar(20);
select * from mynewpokemon;

/*
MISSION 2
DROP
*/
use pokemon;

truncate table myoldpokemon; -- 테이블 값만 지우기
select * from myoldpokemon;

drop table if exists mynewpokemon; -- 테이블 자체 지우기
show tables;

drop database pokemon;
show databases;