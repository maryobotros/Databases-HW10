CREATE DATABASE College;
USE College;


CREATE TABLE Student(
   Snum int NOT NULL,
   Ssn varchar(11) NOT NULL,
   Sname varchar(50),
   Sc_addr varchar(200),
   Sc_phone varchar(15),
   Sp_addr varchar(200),
   Sp_phone varchar(15),
   Sex varchar(6),
   Class varchar(50),
   Major_Code varchar(10),
   Minor_Code varchar(50),
   ProgId int,
   primary key (Ssn, Snum),
   foreign key (ProgId) references DegreeProgram(DegId)
);


CREATE TABLE Department(
   Dcode int NOT NULL,
   Dname varchar(50) NOT NULL unique,
   DofficeNumber varchar(50),
   Dphone varchar(15),
   Dcollege int,
   primary key (Dcode, Dname),
   foreign key (Dcollege) references College(CollegeNum)
);


CREATE TABLE Course(
   Cnum varchar(10) NOT NULL,
   Cname varchar(100),
   Cdesc varchar(500),
   Credit int,
   Clevel varchar(10),
   Cdept int,
   primary key (Cnum),
   foreign key (Cdept) references Department(Dcode)
);


CREATE TABLE Section(
   Sec_num int NOT NULL,
   Iname varchar(50),
   Semester varchar(50),
   Syear int,
   Sec_course varchar(50),
   primary key (Sec_num),
   foreign key (Sec_course) references Course(Cnum)
);


CREATE TABLE Grade(
   Ssn varchar(11),
   Sec_num int,
   Grade varchar(5),
   foreign key (Ssn) references Student(Ssn),
   foreign key(Sec_num) references Section(Sec_num)
);


CREATE TABLE DegreeProgram(
   DegID int NOT NULL,
   Prog varchar(50),
   DegreeType varchar(50),
   primary key (DegID)
);


CREATE TABLE College(
   CollegeNum int NOT NULL,
   CollegeName varchar(100) unique,
   CollegePhone varchar(15),
   CollegeLocation varchar(100),
   primary key (CollegeNum)
);