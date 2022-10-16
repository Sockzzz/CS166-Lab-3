Drop Table if exists Musicians cascade;
drop Table if exists Instrument cascade;
drop Table if exists Album cascade;
drop Table if exists Song cascade;
DROP TABLE IF EXISTS Place cascade;
DROP TABLE IF EXISTS Telephone cascade;
DROP TABLE IF EXISTS Home cascade;
DROP TABLE IF EXISTS Lives cascade;
DROP TABLE IF EXISTS Plays cascade;
DROP TABLE IF EXISTS Perform cascade;
DROP TABLE IF EXISTS Produce cascade;
DROP TABLE IF EXISTS Appear cascade;

create table Musicians(	ssn integer not null,
			name char(20),
			Primary Key(ssn));

create table Instrument(inst_id integer not null,
			key char(10),
			dname char(20),
			Primary Key(inst_id));

create table Album(	alb_id integer not null,
			c_date char(8),
			speed integer,
			title char(15),
			Primary Key(alb_id));

create table Song(	song_id integer not null,
			title char(20),
			author char(20),
			Primary Key(song_id));

create table Place(	address char(30) not null,
			Primary Key(address));

create table Telephone( phone_number integer not null,
			Primary Key(phone_number));

create table Home(	address char(30) not null,
			phone_number integer not null,
			Primary Key(address),
			Foreign Key(address) REFERENCES Place(address),
			Foreign Key(phone_number) REFERENCES Telephone(phone_number));

create table Lives(	address char(30) not null,
			ssn integer not null,
			Primary Key(ssn, address),
			Foreign Key(ssn) REFERENCES Musicians(ssn),
			Foreign Key(address) REFERENCES Home(address));

create table Plays(	ssn integer not null,
			inst_id integer not null,
			Primary Key(ssn, inst_id),
			Foreign Key(ssn) REFERENCES Musicians(ssn),
			Foreign Key(inst_id) REFERENCES Instrument(inst_id));

create table Perform(	ssn integer not null,
			song_id integer not null,
			Primary Key(ssn, song_id),
			Foreign Key(ssn) REFERENCES Musicians(ssn),
			Foreign Key(song_id) REFERENCES Song(song_id));

create table Produce(	ssn integer not null,
			alb_id integer not null,
			Primary Key(ssn),
			Foreign Key(ssn) REFERENCES Musicians(ssn),
			Foreign Key(alb_id) REFERENCES Album(alb_id));

create table Appear( 	alb_id integer not null,
			song_id integer not null,
			Primary Key(alb_id),
			Foreign Key(alb_id) REFERENCES Album(alb_id),
			Foreign Key(song_id) REFERENCES Song(song_id));
