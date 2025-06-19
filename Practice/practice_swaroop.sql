-- Create the Student_Info table
create table course_info (
   coursecode varchar2(10) primary key,
   coursename varchar2(50),
   faculty    varchar2(10)
);

-- Create the Course_Info table
create table student_info (
   studid     varchar2(10) primary key,
   name       varchar2(20),
   email      varchar2(50),
   clas       char(2),
   city       char(3),
   marks      number(5,2), -- 5 total digits 2 decimal place
   coursecode varchar2(10),
   foreign key ( coursecode )
      references course_info ( coursecode )
);

-- Insert data into Course_Info table
insert into course_info (
   coursecode,
   coursename,
   faculty
) values ( 'CS101',
           'Introduction to C',
           'Mr. X' );
insert into course_info (
   coursecode,
   coursename,
   faculty
) values ( 'ME101',
           'Introduction to Mechanics',
           'Mr. GH' );
insert into course_info (
   coursecode,
   coursename,
   faculty
) values ( 'ME102',
           'Intermediate Fluid Mechanics',
           'Mr. JK' );
insert into course_info (
   coursecode,
   coursename,
   faculty
) values ( 'PH101',
           'Introduction to Quantum Mechanics',
           'Mr. M' );

-- Insert data into Student_Info table
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS10',
           'ggsd',
           'ggsd@gmail.com',
           '11',
           'MUM',
           null,
           'PH101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS13',
           'fgmfpxajvm',
           'fgmfpxajvm@gmail.com',
           '11',
           'CHE',
           41.00,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS14',
           'miisa',
           'miisa@gmail.com',
           '11',
           'KOL',
           36.00,
           'PH101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS15',
           'bhlybgtw',
           'bhlybgtw@gmail.com',
           '12',
           'CHE',
           90.00,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS16',
           'usvyuko',
           'usvyuko@gmail.com',
           '12',
           'MUM',
           62.00,
           'PH101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS17',
           'uovrbbg',
           'uovrbbg@gmail.com',
           '11',
           'CHE',
           null,
           'ME101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS18',
           'namhjtj',
           'namhjtj@gmail.com',
           '11',
           'PUN',
           59.00,
           'ME102' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS19',
           'fssnpxvuq',
           'fssnpxvuq@gmail.com',
           '12',
           'DEL',
           98.00,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS2',
           'ompvtfa',
           'ompvtfa@gmail.com',
           '12',
           'PUN',
           null,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS20',
           'yssfjqbray',
           'yssfjqbray@gmail.com',
           '12',
           'MUM',
           64.00,
           'ME101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS21',
           'erffsdrwe',
           'erffsdrwe@gmail.com',
           '12',
           'KOL',
           89.00,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS22',
           'qwqasa',
           'qwqasa@gmail.com',
           '12',
           'PUN',
           98.78,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS3',
           'pbxxs',
           'pbxxs@gmail.com',
           '12',
           'DEL',
           94.00,
           'ME101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS4',
           'uwfoni',
           'uwfoni@gmail.com',
           '12',
           'MUM',
           null,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS47',
           'Arka Roy',
           'rayarka@gmail.com',
           '12',
           'KOL',
           89.56,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS5',
           'jboqezuej',
           'jboqezuej@gmail.com',
           '12',
           'PUN',
           42.00,
           'ME102' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS6',
           'qtmyjaf',
           'qtmyjaf@gmail.com',
           '11',
           'KOL',
           76.00,
           'ME101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS7',
           'hsieb',
           'hsieb@gmail.com',
           '12',
           'KOL',
           66.00,
           'ME102' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS8',
           'gxmvusrmz',
           'gxmvusrmz@gmail.com',
           '12',
           'CHE',
           null,
           'CS101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS9',
           'nfrfrefnna',
           'nfrfrefnna@gmail.com',
           '12',
           'CHE',
           71.00,
           'ME101' );
insert into student_info (
   studid,
   name,
   email,
   clas,
   city,
   marks,
   coursecode
) values ( '2020CS1',
           'owlyw',
           'owlyw@gmail.com',
           '12',
           'MUM',
           52.00,
           'CS101' );

-- query 1
select b.coursecode,
       count(*)
  from student_info a,
       course_info b
 where a.coursecode = b.coursecode
 group by a.coursecode;

-- query 2
select b.coursecode,
       min(a.marks) as "Minimum marks",
       max(a.marks) as "Maximum marks",
       round(
          avg(a.marks),
          2
       ) as "Average marks"
  from student_info a,
       course_info b
 where a.coursecode = b.coursecode
 group by b.coursecode
 order by avg(a.marks) desc;

-- query 3
select count(*)
  from student_info a,
       course_info b
 where a.coursecode = b.coursecode
   and b.faculty = 'Mr. X';


-- Commit the transaction
commit;