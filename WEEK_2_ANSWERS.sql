-- create tables
create table supplier (
   sid   varchar(10) primary key,
   sname varchar(10),
   city  varchar(10)
);

create table item (
   item_id varchar(10) primary key,
   iname   varchar(10),
   color   varchar(10),
   weight  number(5)
);

create table supply (
   sid      varchar(10),
   item_id  varchar(10),
   quantity number(5),
   primary key ( sid,
                 item_id ),
   foreign key ( sid )
      references supplier ( sid ),
   foreign key ( item_id )
      references item ( item_id )
);

-- insert data
insert all into supplier (
   sid,
   sname,
   city
) values ( 'S1',
           'Supplier1',
           'Delhi' ) into supplier (
   sid,
   sname,
   city
) values ( 'S2',
           'Supplier2',
           'Calcutta' ) into supplier (
   sid,
   sname,
   city
) values ( 'S3',
           'Supplier3',
           'Mumbai' ) into supplier (
   sid,
   sname,
   city
) values ( 'S4',
           'Supplier4',
           'Delhi' ) into supplier (
   sid,
   sname,
   city
) values ( 'S5',
           'Supplier5',
           'Chennai' ) into supplier (
   sid,
   sname,
   city
) values ( 'S6',
           'Supplier6',
           'Mumbai' ) select 1
             from dual;

insert all into item (
   item_id,
   iname,
   color,
   weight
) values ( 'ITEM1',
           'Item1',
           'Red',
           50 ) into item (
   item_id,
   iname,
   color,
   weight
) values ( 'ITEM2',
           'Item2',
           'Blue',
           30 ) into item (
   item_id,
   iname,
   color,
   weight
) values ( 'ITEM3',
           'Item3',
           'Green',
           20 ) into item (
   item_id,
   iname,
   color,
   weight
) values ( 'ITEM4',
           'Item4',
           'Red',
           40 ) into item (
   item_id,
   iname,
   color,
   weight
) values ( 'ITEM5',
           'Item5',
           'Yellow',
           10 ) select 1
       from dual;

insert all into supply (
   sid,
   item_id,
   quantity
) values ( 'S1',
           'ITEM1',
           300 ) into supply (
   sid,
   item_id,
   quantity
) values ( 'S2',
           'ITEM2',
           200 ) into supply (
   sid,
   item_id,
   quantity
) values ( 'S3',
           'ITEM3',
           150 ) into supply (
   sid,
   item_id,
   quantity
) values ( 'S4',
           'ITEM1',
           100 ) into supply (
   sid,
   item_id,
   quantity
) values ( 'S4',
           'ITEM2',
           250 ) into supply (
   sid,
   item_id,
   quantity
) values ( 'S5',
           'ITEM4',
           500 ) select 1
        from dual;

-- 2
select *
  from supplier;

-- 3
select distinct ( s.item_id ),
                i.iname
  from supply s,
       item i
 where s.item_id = i.item_id;

-- 4
select *
  from supplier
 where city = 'Delhi';

-- 5
select *
  from supplier
 where city <> 'Calcutta';

-- 6
select *
  from supplier
 where sid not in (
   select sid
     from supply
);

-- 7
select distinct ( sy.sid ),
                sr.sname
  from supply sy,
       supplier sr
 where sy.sid = sr.sid;

-- 8
select sy.sid,
       sr.sname
  from supply sy,
       supplier sr
 where sy.sid = sr.sid
   and item_id = 'ITEM1';

-- 9
select s1.sid
  from supply s1
  join supply s2
on s1.sid = s2.sid
 where s1.item_id = 'ITEM1'
   and s2.item_id = 'ITEM2';

-- 10
select distinct ( sid )
  from supply
 where item_id in ( 'ITEM1',
                    'ITEM2' );

-- 11
select sr.sname
  from supplier sr,
       item i,
       supply sy
 where sy.sid = sr.sid
   and sy.item_id = i.item_id
   and i.color = 'Red';

-- 12
select sr.sname
  from supplier sr,
       item i,
       supply sy
 where sy.sid = sr.sid
   and sy.item_id = i.item_id
   and i.color = 'Red'
   and sy.quantity between 200 and 500;

-- 13
select distinct ( s1.item_id )
  from supply s1
  join supply s2
on s1.item_id = s2.item_id
 where s1.sid != s2.sid;

-- 13
select item_id
  from supply
 group by item_id
having count(distinct sid) >= 2;

-- 14
select sid
  from supply
 group by sid
having count(distinct item_id) = (
   select count(*)
     from item
);

-- 15
select *
  from supply
 where quantity = (
   select max(quantity)
     from supply
);