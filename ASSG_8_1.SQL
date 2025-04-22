set serveroutput on
create table prime_entry(
num_id number(3) primary key,
Prime_num number(3) Not null
);

create sequence seqw
start with 1 
increment by 1
/