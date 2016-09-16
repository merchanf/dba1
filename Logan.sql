
create view punto1 as 
WITH A AS(
SELECT COUNT(TABLE_NAME) AS TOTAL_TABLAS, OWNER
FROM DBA_TABLES
GROUP BY OWNER
),
C AS(
SELECT COUNT(VIEW_NAME) AS TOTAL_VISTAS, OWNER
FROM DBA_VIEWS
GROUP BY OWNER
),
L AS(
SELECT COUNT(MVIEW_NAME) AS TOTAL_VISTAS_MAT, OWNER
FROM DBA_MVIEWS
GROUP BY OWNER
),
D AS(
SELECT COUNT(TRIGGER_NAME) AS TOTAL_TRIGGERS, OWNER
FROM DBA_TRIGGERS
GROUP BY OWNER
), 
E AS(
SELECT B.USERNAME , A.TOTAL_TABLAS,  B.ACCOUNT_STATUS , B.DEFAULT_TABLESPACE , B.CREATED 
FROM DBA_USERS B
LEFT OUTER JOIN A
ON B.USERNAME = A.OWNER 
),
F AS(
SELECT E.USERNAME , E.TOTAL_TABLAS, C.TOTAL_VISTAS,  E.ACCOUNT_STATUS , E.DEFAULT_TABLESPACE , E.CREATED 
FROM E
LEFT OUTER JOIN C
ON E.USERNAME = C.OWNER
),
G AS(
SELECT F.USERNAME , F.TOTAL_TABLAS, F.TOTAL_VISTAS, D.TOTAL_TRIGGERS, F.ACCOUNT_STATUS , F.DEFAULT_TABLESPACE , F.CREATED 
FROM F
LEFT OUTER JOIN D
ON F.USERNAME = D.OWNER
)
SELECT G.USERNAME , G.TOTAL_TABLAS, G.TOTAL_VISTAS, L.TOTAL_VISTAS_MAT, G.TOTAL_TRIGGERS, G.ACCOUNT_STATUS, G.DEFAULT_TABLESPACE, G.CREATED 
FROM G
LEFT OUTER JOIN L
ON G.USERNAME = L.OWNER;

select * from punto1;

--  Para el punto 2

create view tablas_dba as 
select * from DBA_TABLES;

create view vistas_dba as 
select * from DBA_VIEWS;

--  Para el punto 3

create view columnas_dba as 
select * from DBA_TAB_COLUMNS;

create view restricciones_punto3 as 
select A.OWNER , A.TABLE_NAME , B.COLUMN_NAME , A.CONSTRAINT_TYPE 
from all_constraints A , DBA_CONS_COLUMNS B 
WHERE A.CONSTRAINT_NAME = B.CONSTRAINT_NAME;

-- -----------------------------------------


select * from punto1;
select * from DBA_TABLES;
select * from DBA_VIEWS;
select * from DBA_TAB_COLUMNS where OWNER='LOGAN';
select * from DBA_CONS_COLUMNS where OWNER='LOGAN';
select * from DBA_CONS_COLUMNS;
select * from restricciones_punto3;


CREATE TABLE CLIENTE 
(
  codigo number(10),
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  fecha VARCHAR(100),
  CONSTRAINT LLAVE_CLIENTE PRIMARY KEY (codigo)
);
CREATE TABLE PRODUCTO 
(
  codigopro number(10),
  nombre VARCHAR(100),
  apellido VARCHAR(100),
  fecha VARCHAR(100),
  CONSTRAINT LLAVE_PRODUCTO PRIMARY KEY (codigopro)
);

drop table PRODUCTO;