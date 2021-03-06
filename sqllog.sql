create database itthumb;

create user jsy IDENTIFIED by '1234';

grant select, insert, update, delete, create, drop, alter on itthumb.* to 'jsy'@'%' IDENTIFIED by '1234'

create table user(
	memberid varchar(30) PRIMARY KEY,
	password varchar(255),
	name varchar(10),
	regdate date,
	tel varchar(15),
	membergrade int(2),
	recognizecode int(5),
	image varchar(50),
	birth date,
	industy varchar(50),
	site varchar(50),
	slogun varchar(100),
	companyserial varchar(50),
	introduce varchar(500),
	modifydate date,
	address varchar(50),
	locking int(2),
	createpf int(2)
)

create table hireboard(
   hireno int PRIMARY KEY,
   qualification varchar(100),
   hirestatus varchar(20),
   salary varchar(15),
   workday varchar(20),
   memberid varchar(30),
   hide int(2),
   deadline datetime,
   readcnt int,
   subject varchar(100),
   image varchar(200),
   content varchar(2000),
   region varchar(10),
   company varchar(20),
   regionetc varchar(30),
   regdate datetime,
   career varchar(5),
   careerdate varchar(20),
   scrapnum int,
   regiongu varchar(5)
)

create table studygroup(
	groupno int PRIMARY KEY,
	studyno int,
	leadermember varchar(20),
	regmember varchar(20),
	state int
)

create table scrap (
   scrap int not null primary key,
   memberid varchar(30) not null,
   hireno int,
   studyno int,
   scrapmember varchar(30)
)

create table study(
	studyno int PRIMARY KEY,
	memberid varchar(30),
	region varchar(50),
	studyname varchar(100),
	regdate date,
	nowmember int,
	limitmember int,
	content varchar(5000),
	weekday varchar(20),
	starttime varchar(10),
	endtime varchar(10),
	membername varchar(20)
)
create table message(
	messageno int PRIMARY KEY,
	sender varchar(20),
	receiver varchar(20),
	subject varchar(100),
	content varchar(500),
	senddate datetime,
	senddelete int(2),
	receivedelete int(2),
	confirm int(2)
)

create table community(
	communityno int PRIMARY KEY,
	memberid varchar(30),
	subject varchar(100),
	content varchar(5000),
	regdate datetime,
	communitykind int,
	readcnt int
	
)
create table filerep(
	fileno int PRIMARY KEY,
	communityno int,
	fname varchar(50)
)
create table reply(
	replyno int PRIMARY KEY,
	memberid varchar(30),
	name varchar(20),
	content varchar(1000),
	regdate datetime,
	ref int,
	reflevel int,
	refstep int,
	communityno int
)

CREATE TABLE project
(
	projectno int primary key,
	memberid varchar(30) NOT NULL,
	subject varchar(10) NOT NULL,
	imagefile varchar(100),
	term varchar(50),
	content varchar(4000) NOT NULL,
	role varchar(100),
	link varchar(100),
	skills varchar(500)
);

create table history(
	historyno int primary key,
	memberid varchar(30) not null,
	content varchar(50),
	skillful int,
	getdate date,
	enddate date,
	kindno int
);

create table companyinfo(
   infono int primary key,
   memberid varchar(30),
   ceoname varchar(20),
   worker int,
   sales int,
   profit int,
   capital int,
   insurance varchar(100),
   salsystem varchar(100),
   benefit varchar(100),
   mood varchar(100),
   anniversary varchar(50),
   health varchar(40),
   office varchar(100),
   clothes varchar(40),
   meal varchar(100),
   supplies varchar(200),
   care varchar(40),
   supportfund varchar(150),
   education varchar(100),
   companyevent varchar(100),
   traffic varchar(40),
   society varchar(50)
);


CREATE TABLE companyhistory (

    historyno int primary key,
    memberid varchar(30),
    historydate varchar(20),
    content varchar(100)
);