DROP TABLE Professor;
DROP TABLE Dept;
DROP TABLE Project;
DROP TABLE Graduate;
DROP TABLE Work_dept;


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

CREATE TABLE Work_dept(	time_pc integer,
			ssn integer not null,
			dno integer not null,
			PRIMARY KEY(ssn, dno),
			FOREIGN KEY(ssn) REFERENCES Professor(ssn),
			FORIEGN KEY(dno) REFERENCES Dept(dno));

CREATE TABLE 
