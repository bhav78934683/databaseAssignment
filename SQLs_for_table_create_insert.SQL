/*************************************/
/* DROP TABLES*/
/************************************/
DROP TABLE OWNER;
DROP TABLE VEHICLE;
DROP TABLE SERVICE;
DROP TABLE REQUEST;
DROP TABLE LINE;
/************************************/
/*CREATE OWNER TABLE*/
/************************************/
CREATE TABLE OWNER (
OWN_NUM                 NUMBER(38,0),
OWN_LAST_NAME           VARCHAR2(25 BYTE)  NOT NULL,
OWN_FIRST_NAME          VARCHAR2(25 BYTE)  NOT NULL,
OWN_STREET              VARCHAR2(25 BYTE)  NOT NULL,
OWN_CITY                VARCHAR2(25 BYTE)  NOT NULL,
OWN_STATE               VARCHAR2(3 BYTE)  NOT NULL,
PRIMARY KEY (OWN_NUM));
/************************************/
/* CREATE VEHICLE TABLE*/
/************************************/
CREATE TABLE VEHICLE (
VEH_NUM                 NUMBER(38,0)  CONSTRAINT VEHICLE_VEH_NUM_PK PRIMARY KEY,
VEH_MAKE                VARCHAR2(25 BYTE)  NOT NULL,
VEH_MODEL               VARCHAR2(5 BYTE) NOT NULL,
VEH_YEAR                VARCHAR2(5 BYTE)  NOT NULL,
VEH_COLOR               VARCHAR2(25 BYTE)  NOT NULL,
VEH_PLATE               VARCHAR2(25 BYTE)  NOT NULL,
VEH_STATE               VARCHAR2(3 BYTE)  NOT NULL,
OWN_NUM                 NUMBER(38,0),
CONSTRAINT VEHICLE_OWN_NUM_FK
FOREIGN KEY  (OWN_NUM)  REFERENCES OWNER);
/************************************/
/*CREATE SERVICE TABLE*/
/************************************/
CREATE TABLE SERVICE (
SVC_NUM                NUMBER(38,0) PRIMARY KEY,
SVR_NAME               VARCHAR2(25 BYTE) NOT NULL,
SVC_EST_HOURS          NUMBER(3,1) DEFAULT 0.00  NOT NULL,
SVC_EST_PRICE          NUMBER(6,2)  DEFAULT 0.00  NOT NULL );   
/************************************/
/*CREATE REQUEST TABLE*/
/************************************/
CREATE TABLE REQUEST (
REQ_NUM                NUMBER(38,0) PRIMARY KEY,
VEH_NUM                NUMBER(38,0),
REQ_DATE               DATE ,
CONSTRAINT REQUEST_VEH_NUM_FK
FOREIGN KEY  (VEH_NUM)  REFERENCES VEHICLE);
/************************************/
/*CREATE LINE TABLE*/
/************************************/
CREATE TABLE LINE (
LN_NUM                 NUMBER(38,0) PRIMARY KEY,
REQ_NUM                NUMBER(38,0),
SVC_NUM                NUMBER(38,0),
LN_HOURS               NUMBER(3,1) NOT NULL,
LN_PRICE               NUMBER(6,2) NOT NULL,
CONSTRAINT LINE_REQ_NUM_FK
FOREIGN KEY  (REQ_NUM)  REFERENCES REQUEST ,
CONSTRAINT LINE_SVC_NUM_FK
FOREIGN KEY  (SVC_NUM)  REFERENCES SERVICE );
/*************************************/
/* DESCRIBE TABLES*/
/************************************/
DESC OWNER;
DESC VEHICLE;
DESC SERVICE;
DESC REQUEST;
DESC LINE;
/*************************************/
/* DESCRIBE TABLES RESULTS */
/************************************/
/*
DESC OWNER
Name           Null     Type         
-------------- -------- ------------ 
OWN_NUM        NOT NULL NUMBER(38)   
OWN_LAST_NAME  NOT NULL VARCHAR2(25) 
OWN_FIRST_NAME NOT NULL VARCHAR2(25) 
OWN_STREET     NOT NULL VARCHAR2(25) 
OWN_CITY       NOT NULL VARCHAR2(25) 
OWN_STATE      NOT NULL VARCHAR2(3)  

DESC VEHICLE
Name      Null     Type         
--------- -------- ------------ 
VEH_NUM   NOT NULL NUMBER(38)   
VEH_MAKE  NOT NULL VARCHAR2(25) 
VEH_MODEL NOT NULL VARCHAR2(5)  
VEH_YEAR  NOT NULL VARCHAR2(5)  
VEH_COLOR NOT NULL VARCHAR2(25) 
VEH_PLATE NOT NULL VARCHAR2(25) 
VEH_STATE NOT NULL VARCHAR2(3)  
OWN_NUM            NUMBER(38)   

DESC SERVICE
Name          Null     Type         
------------- -------- ------------ 
SVC_NUM       NOT NULL NUMBER(38)   
SVR_NAME      NOT NULL VARCHAR2(25) 
SVC_EST_HOURS NOT NULL NUMBER(3,1)  
SVC_EST_PRICE NOT NULL NUMBER(6,2)  

DESC REQUEST
Name     Null     Type       
-------- -------- ---------- 
REQ_NUM  NOT NULL NUMBER(38) 
VEH_NUM           NUMBER(38) 
REQ_DATE          DATE       

DESC LINE
Name     Null     Type        
-------- -------- ----------- 
LN_NUM   NOT NULL NUMBER(38)  
REQ_NUM           NUMBER(38)  
SVC_NUM           NUMBER(38)  
LN_HOURS NOT NULL NUMBER(3,1) 
LN_PRICE NOT NULL NUMBER(6,2) 

Elapsed: 00:00:00.023
*/