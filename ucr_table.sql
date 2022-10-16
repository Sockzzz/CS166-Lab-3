DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Dept;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Graduate;
DROP TABLE IF EXISTS work_dept;
DROP TABLE IF EXISTS Runs;
DROP TABLE IF EXISTS work_proj;
DROP TABLE IF EXISTS advise;
DROP TABLE IF EXISTS supervise;
DROP TABLE IF EXISTS major;
DROP TABLE IF EXISTS manage;
DROP TABLE IF EXISTS work_in;


CREATE TABLE Professor( ssn INTEGER NOT NULL,
			name char(20),
			age integer,
			rank char(10),
			specialty char(20),
			PRIMARY KEY(ssn));

CREATE TABLE Dept(	dno integer not null,
			dname char(20),
			office char(20),
			PRIMARY KEY(dno));

CREATE TABLE Project(	pno integer not null,
			sponsor char(20),
			start_date char(8),
			end_date char(8),
			budget integer,
			PRIMARY KEY(pno));

CREATE TABLE Graduate(	ssn integer not null,
			name char(20),
			age integer,
			deg_pg char(20),
			PRIMARY KEY(ssn));

CREATE TABLE work_dept(	time_pc integer,
			ssn integer not null,
			dno integer not null,
			PRIMARY KEY(ssn, dno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn),
			FOREIGN KEY(dno) REFERENCES Dept(dno));

CREATE TABLE Runs (	ssn integer not null,
			dno integer not null,
			PRIMARY KEY(ssn),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn));

CREATE TABLE work_proj(	since integer,
			ssn integer not null,
			pno integer not null,
			PRIMARY KEY(ssn, pno),
			FOREIGN KEY(ssn) REFERENCES Graduate(ssn),
			FOREIGN KEY(pno) REFERENCES Project(pno));

CREATE TABLE advise( 	grad integer,
			senior integer,
			PRIMARY KEY(grad, senior),
			FOREIGN KEY(grad) REFERENCES Graduate(ssn),
			FOREIGN KEY(senior) REFERENCES Graduate(ssn));

CREATE TABLE major(	ssn integer not null,
			dno integer not null,
			PRIMARY KEY(dno),
			FOREIGN KEY(dno) REFERENCES Dept(dno));

CREATE TABLE supervise(	ssn integer not null,
			pno integer not null,
			PRIMARY KEY(ssn),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn));

CREATE TABLE manage(	ssn integer not null,
			pno integer not null,
			PRIMARY KEY(ssn),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn));

CREATE TABLE work_in(	ssn integer not null,
			pno integer not null,
			PRIMARY KEY(ssn, pno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn),
			FOREIGN KEY(pno) REFERENCES Project(pno));


