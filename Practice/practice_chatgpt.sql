-- create tables
create table vehicle (
   reg_no varchar2(5) primary key,
   model  varchar2(10),
   year   number(4)
);

create table service_center (
   center_id   varchar2(5) primary key,
   center_name varchar(10),
   city        varchar(10)
);

create table serviced (
   reg_no       varchar2(5),
   center_id    varchar2(5),
   service_date date,
   cost         number(5),
   foreign key ( reg_no )
      references vehicle,
   foreign key ( center_id )
      references service_center
);

-- (i) Have been serviced more than twice.
select *
  from vehicle
 where reg_no in (
   select reg_no
     from serviced
    group by reg_no
   having count(reg_no) >= 2
);

-- (ii) Have a total service cost exceeding ₹20,000. Sort the output by total cost in descending order.
select s.reg_no,
       v.model,
       sum(s.cost) as "total_cost"
  from serviced s,
       vehicle v
 where s.reg_no = v.reg_no
 group by s.reg_no,
          v.model
having sum(s.cost) >= 20000
 order by sum(s.cost) desc;

-- (iii) Only include vehicles that were serviced at least once in the year 2023.
select *
  from vehicle
 where reg_no in (
   select distinct ( reg_no )
     from serviced
    where extract(year from service_date) = '2023'
);

-- (iv) model starts with the letter 'S' and have a manufacturing year after 2015.
select *
  from vehicle
 where model like 'S%'
   and year > 2015;


-- (v) Find the names of service centers along with the number of unique vehicles they have serviced in the
-- last 2 years, but only include those centers that have serviced at least 3 different vehicles.
select center_name, center_id
  from service_center
 where center_id in (
   select center_id
     from serviced
    where extract(year from service_date) between 2023 and 2025
    group by center_id
   having count(distinct(reg_no)) >= 3
);


-- (vi) Delete the vehicle record whose registation is before 2010
delete from serviced
 where reg_no in (
   select reg_no
     from vehicle
    where year < 2010
);
delete from vehicle
 where year < 2010;
commit;

-- insert data
REM INSERTING into "SYSTEM"."VEHICLE"
SET DEFINE OFF;
Insert into "SYSTEM"."VEHICLE" (REG_NO,MODEL,YEAR) values ('R1','Alto',2025);
Insert into "SYSTEM"."VEHICLE" (REG_NO,MODEL,YEAR) values ('R2','Swift',2024);
Insert into "SYSTEM"."VEHICLE" (REG_NO,MODEL,YEAR) values ('R3','Audi',2025);
Insert into "SYSTEM"."VEHICLE" (REG_NO,MODEL,YEAR) values ('R5','Bolero',2015);

REM INSERTING into "SYSTEM"."SERVICE_CENTER"
SET DEFINE OFF;
Insert into "SYSTEM"."SERVICE_CENTER" (CENTER_ID,CENTER_NAME,CITY) values ('C1','fsdfs','Kolkata');
Insert into "SYSTEM"."SERVICE_CENTER" (CENTER_ID,CENTER_NAME,CITY) values ('C2','abaoqj','Mumbai');
Insert into "SYSTEM"."SERVICE_CENTER" (CENTER_ID,CENTER_NAME,CITY) values ('C3','josdlkl','Delhi');

REM INSERTING into "SYSTEM"."SERVICED"
SET DEFINE OFF;
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R1','C1',to_date('12/02/25','DD/MM/RR'),10000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R1','C2',to_date('02/12/24','DD/MM/RR'),15000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R1','C1',to_date('17/04/25','DD/MM/RR'),5000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R2','C1',to_date('26/05/25','DD/MM/RR'),12000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R3','C2',to_date('26/07/23','DD/MM/RR'),35000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R3','C2',to_date('09/10/23','DD/MM/RR'),8000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R5','C1',to_date('08/08/20','DD/MM/RR'),9000);
Insert into "SYSTEM"."SERVICED" (REG_NO,CENTER_ID,SERVICE_DATE,COST) values ('R5','C1',to_date('12/12/24','DD/MM/RR'),15000);