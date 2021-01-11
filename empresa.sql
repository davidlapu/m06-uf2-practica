SET AUTOCOMMIT=1;

CREATE DATABASE IF NOT EXISTS empresa;

USE empresa; 



CREATE TABLE IF NOT EXISTS empresa.DEPT (
 DEPT_NO  TINYINT (2) UNSIGNED,
 DNOM     VARCHAR(14) NOT NULL UNIQUE,
 LOC      VARCHAR(14),
 PRIMARY KEY (DEPT_NO) ) ;


INSERT INTO empresa.DEPT VALUES (10, 'COMPTABILITAT', 'SEVILLA');
INSERT INTO empresa.DEPT VALUES (20, 'INVESTIGACIÓ', 'MADRID');
INSERT INTO empresa.DEPT VALUES (30, 'VENDES', 'BARCELONA');
INSERT INTO empresa.DEPT VALUES (40, 'PRODUCCIÓ', 'BILBAO');


CREATE TABLE IF NOT EXISTS empresa.EMP (
 EMP_NO    SMALLINT (4) UNSIGNED,
 COGNOM    VARCHAR (10) NOT NULL,
 OFICI     VARCHAR (10),
 CAP       SMALLINT (4) UNSIGNED,
 DATA_ALTA DATE,
 SALARI    INT UNSIGNED,
 COMISSIO  INT UNSIGNED,
 DEPT_NO   TINYINT (2) UNSIGNED NOT NULL,
 PRIMARY KEY (EMP_NO),
 INDEX IDX_EMP_CAP (CAP),
 INDEX IDX_EMP_DEPT_NO (DEPT_NO),
 FOREIGN KEY (DEPT_NO) REFERENCES empresa.DEPT(DEPT_NO)) ;


CREATE INDEX EMP_COGNOM ON empresa.EMP (COGNOM);
CREATE INDEX EMP_DEPT_NO_EMP ON empresa.EMP (DEPT_NO,EMP_NO);

INSERT INTO empresa.EMP VALUES (7369,'SÁNCHEZ','EMPLEAT',7902, '1980-12-17', 104000,NULL,20);
INSERT INTO empresa.EMP VALUES (7499,'ARROYO','VENEDOR',7698, '1980-02-20', 208000,39000,30);
INSERT INTO empresa.EMP VALUES (7521,'SALA','VENEDOR',7698, '1981-02-22', 162500,65000,30);
INSERT INTO empresa.EMP VALUES (7566,'JIMÉNEZ','DIRECTOR',7839, '1981-04-02', 386750,NULL,20);
INSERT INTO empresa.EMP VALUES (7654,'MARTÍN','VENEDOR',7698, '1981-09-29', 162500,182000,30);
INSERT INTO empresa.EMP VALUES (7698,'NEGRO','DIRECTOR',7839, '1981-05-01', 370500,NULL,30);
INSERT INTO empresa.EMP VALUES (7782,'CEREZO','DIRECTOR',7839, '1981-06-09', 318500,NULL,10);
INSERT INTO empresa.EMP VALUES (7788,'GIL','ANALISTA',7566, '1981-11-09', 390000,NULL,20);
INSERT INTO empresa.EMP VALUES (7839,'REY','PRESIDENT',NULL, '1981-11-17', 650000,NULL,10);
INSERT INTO empresa.EMP VALUES (7844,'TOVAR','VENEDOR',7698, '1981-09-08', 195000,0,30);
INSERT INTO empresa.EMP VALUES (7876,'ALONSO','EMPLEAT',7788, '1981-09-23', 143000,NULL,20);
INSERT INTO empresa.EMP VALUES (7900,'JIMENO','EMPLEAT',7698, '1981-12-03', 123500,NULL,30);
INSERT INTO empresa.EMP VALUES (7902,'FERNÁNDEZ','ANALISTA',7566, '1981-12-03', 390000,NULL,20);
INSERT INTO empresa.EMP VALUES (7934,'MUÑOZ','EMPLEAT',7782, '1982-01-23', 169000,NULL,10);


ALTER TABLE empresa.EMP
ADD FOREIGN KEY (CAP) REFERENCES EMP(EMP_NO);



CREATE TABLE IF NOT EXISTS empresa.CLIENT (
 CLIENT_COD          INT(6) UNSIGNED PRIMARY KEY,
 NOM                 VARCHAR (45) NOT NULL,
 ADRECA              VARCHAR (40) NOT NULL,
 CIUTAT              VARCHAR (30) NOT NULL,
 ESTAT               VARCHAR (2),
 CODI_POSTAL         VARCHAR (9) NOT NULL,
 AREA                SMALLINT(3),
 TELEFON             VARCHAR (9),
 REPR_COD            SMALLINT(4) UNSIGNED,
 LIMIT_CREDIT        DECIMAL(9,2) UNSIGNED,
 OBSERVACIONS        TEXT,
 INDEX IDX_CLIENT_REPR_COD (REPR_COD),
 FOREIGN KEY (REPR_COD) REFERENCES empresa.EMP(EMP_NO));

CREATE INDEX CLIENT_NOM ON empresa.CLIENT (NOM);
CREATE INDEX CLIENT_REPR_CLI ON empresa.CLIENT (REPR_COD, CLIENT_COD);


INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (100, 'JOCKSPORTS', '345 VIEWRIDGE', 'BELMONT', 'CA', '96711', 415,
        '598-6609', 7844, 5000, 
        'Very friendly people to work with -- sales rep likes to be called Mike.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (101, 'TKB SPORT SHOP', '490 BOLI RD.', 'REDWOOD CIUTAT', 'CA', '94061', 415,
        '368-1223', 7521, 10000, 
        'Rep called 5/8 about change in order - contact shipping.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (102, 'VOLLYRITE', '9722 HAMILTON', 'BURLINGAME', 'CA', '95133', 415,
        '644-3341', 7654, 7000, 
        'Company doing heavy promotion beginning 10/89. Prepare for large orders during winter.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (103, 'JUST TENNIS', 'HILLVIEW MALL', 'BURLINGAME', 'CA', '97544', 415,
        '677-9312', 7521, 3000, 
        'Contact rep about new line of tennis rackets.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (104, 'EVERY MOUNTAIN', '574 SURRY RD.', 'CUPERTINO', 'CA', '93301', 408,
        '996-2323', 7499, 10000, 
        'CLIENT with high market share (23%) due to aggressive advertising.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (105, 'K + T SPORTS', '3476 EL PASEO', 'SANTA CLARA', 'CA', '91003', 408,
        '376-9966', 7844, 5000, 
        'Tends to order large amounts of merchandise at once. Accounting is considering raising their credit limit. Usually pays on time.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (106, 'SHAPE UP', '908 SEQUOIA', 'PALO ALTO', 'CA', '94301', 415,
        '364-9777', 7521, 6000, 
        'Support intensive. Orders small amounts (< 800) of merchandise at a time.');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (107, 'WOMEN SPORTS', 'VALCO VILLAGE', 'SUNNYVALE', 'CA', '93301', 408,
        '967-4398', 7499, 10000, 
        'First sporting goods store geared exclusively towards women. Unusual promotion al style and very willing to take chances towards new PRODUCTEs!');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (108, 'NORTH WOODS HEALTH AND FITNESS SUPPLY CENTER', '98 LONE PINE WAY', 'HIBBING', 'MN', '55649', 612,
        '566-9123', 7844, 8000, '');
INSERT INTO empresa.CLIENT (CLIENT_COD, NOM, ADRECA, CIUTAT, ESTAT, CODI_POSTAL, AREA, 
                      TELEFON, REPR_COD, LIMIT_CREDIT, OBSERVACIONS)
VALUES (109, 'SPRINGFIELD NUCLEAR POWER PLANT', '13 PERCEBE STR.', 'SPRINGFIELD', 'NT', '0000', 636,
        '999-6666', NULL, 10000, '');



CREATE TABLE IF NOT EXISTS empresa.PRODUCTE (
 PROD_NUM     INT (6) UNSIGNED PRIMARY KEY,
 DESCRIPCIO   VARCHAR (30) NOT NULL  UNIQUE);


INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (100860, 'ACE TENNIS RACKET I');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (100861, 'ACE TENNIS RACKET II');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (100870, 'ACE TENNIS BALLS-3 PACK');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (100871, 'ACE TENNIS BALLS-6 PACK');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (100890, 'ACE TENNIS NET');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (101860, 'SP TENNIS RACKET');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (101863, 'SP JUNIOR RACKET');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (102130, 'RH: "GUIDE TO TENNIS"');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (200376, 'SB ENERGY BAR-6 PACK');
INSERT INTO empresa.PRODUCTE (PROD_NUM, DESCRIPCIO)
VALUES (200380, 'SB VITA SNACK-6 PACK');


CREATE TABLE IF NOT EXISTS empresa.COMANDA  (
 COM_NUM             SMALLINT(4) UNSIGNED PRIMARY KEY,
 COM_DATA            DATE,
 COM_TIPUS           CHAR (1) CHECK (COM_TIPUS IN ('A','B','C')),
 CLIENT_COD          INT (6) UNSIGNED NOT NULL,
 DATA_TRAMESA        DATE,
 TOTAL               DECIMAL(8,2) UNSIGNED,
 INDEX IDX_COMANDA_CLIENT_COD (CLIENT_COD),  
 FOREIGN KEY (CLIENT_COD) REFERENCES empresa.CLIENT(CLIENT_COD) );

CREATE INDEX COMANDA_DATA_NUM ON empresa.COMANDA (COM_DATA,COM_NUM);
CREATE INDEX COMANDA_TRAMESA_NUM ON empresa.COMANDA (DATA_TRAMESA,COM_NUM);


INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (610, '1987-01-07', 'A', 101, '1987-01-08', 101.4);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (611, '1987-01-11', 'B', 102,'1987-01-11', 45);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (612, '1987-01-15', 'C', 104, '1987-01-20', 5860);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (601, '1986-05-01', 'A', 106, '1986-05-30', 2.4);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (602, '1986-06-05', 'B', 102, '1986-06-20', 56);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (604, '1986-06-15', 'A', 106, '1986-06-30', 698);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (605, '1986-07-14', 'A', 106,  '1986-07-30', 8324);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (606, '1986-07-14', 'A', 100,  '1986-07-30', 3.4);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (609, '1986-08-01', 'B', 100,  '1986-08-15', 97.5);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (607, '1986-07-18', 'C', 104,  '1986-07-18', 5.6);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (608, '1986-07-25', 'C', 104,  '1986-07-25', 35.2);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (603, '1986-06-05', NULL, 102, '1986-06-05', 224);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (620, '1987-03-12', NULL, 100, '1987-03-12', 4450);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (613, '1987-02-01', NULL, 108, '1987-02-01', 6400);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (614, '1987-02-01', NULL, 102, '1987-02-05', 23940);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (616, '1987-02-03', NULL, 103, '1987-02-10', 764);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (619, '1987-02-22', NULL, 104, '1987-02-04', 1260);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (617, '1987-02-05', NULL, 104, '1987-03-03', 46370);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (615, '1987-02-01', NULL, 107, '1987-02-06', 710);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (618, '1987-02-15', 'A', 102, '1987-03-06', 3510.5);
INSERT INTO empresa.COMANDA (COM_NUM, COM_DATA, COM_TIPUS, CLIENT_COD, DATA_TRAMESA, TOTAL)
VALUES (621, '1987-03-15', 'A', 100, '1987-01-01', 730);



CREATE TABLE IF NOT EXISTS empresa.DETALL  (
 COM_NUM             SMALLINT(4) UNSIGNED,
 DETALL_NUM          SMALLINT(4) UNSIGNED,
 PROD_NUM            INT(6) UNSIGNED NOT NULL,
 PREU_VENDA          DECIMAL(8,2) UNSIGNED,
 QUANTITAT           INT (8),
 IMPORT              DECIMAL(8,2),
 CONSTRAINT DETALL_PK PRIMARY KEY (COM_NUM,DETALL_NUM),
 INDEX IDX_DETAL_COM_NUM (COM_NUM),
 INDEX IDX_PROD_NUM (PROD_NUM),
 FOREIGN KEY (COM_NUM) REFERENCES empresa.COMANDA(COM_NUM),
 FOREIGN KEY (PROD_NUM) REFERENCES empresa.PRODUCTE(PROD_NUM));


CREATE INDEX DETALL_PROD_COM_DET ON empresa.DETALL (PROD_NUM,COM_NUM,DETALL_NUM);


INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (610, 3, 100890, 58, 1, 58);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (611, 1, 100861, 45, 1, 45);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (612, 1, 100860, 30, 100, 3000);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (601, 1, 200376, 2.4, 1, 2.4);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (602, 1, 100870, 2.8, 20, 56);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (604, 1, 100890, 58, 3, 174);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (604, 2, 100861, 42, 2, 84);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (604, 3, 100860, 44, 10, 440);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (603, 2, 100860, 56, 4, 224);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (610, 1, 100860, 35, 1, 35);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (610, 2, 100870, 2.8, 3, 8.4);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (613, 4, 200376, 2.2, 200, 440);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (614, 1, 100860, 35, 444, 15540);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (614, 2, 100870, 2.8, 1000, 2800);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (612, 2, 100861, 40.5, 20, 810);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (612, 3, 101863, 10, 150, 1500);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (620, 1, 100860, 35, 10, 350);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (620, 2, 200376, 2.4, 1000, 2400);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (620, 3, 102130, 3.4, 500, 1700);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (613, 1, 100871, 5.6, 100, 560);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (613, 2, 101860, 24, 200, 4800);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (613, 3, 200380, 4, 150, 600);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (619, 3, 102130, 3.4, 100, 340);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 1, 100860, 35, 50, 1750);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 2, 100861, 45, 100, 4500);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (614, 3, 100871, 5.6, 1000, 5600);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (616, 1, 100861, 45, 10, 450);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (616, 2, 100870, 2.8, 50, 140);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (616, 3, 100890, 58, 2, 116);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (616, 4, 102130, 3.4, 10, 34);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (616, 5, 200376, 2.4, 10, 24);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (619, 1, 200380, 4, 100, 400);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (619, 2, 200376, 2.4, 100, 240);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (615, 1, 100861, 45, 4, 180);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (607, 1, 100871, 5.6, 1, 5.6);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (615, 2, 100870, 2.8, 100, 280);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 3, 100870, 2.8, 500, 1400);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 4, 100871, 5.6, 500, 2800);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 5, 100890, 58, 500, 29000);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 6, 101860, 24, 100, 2400);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 7, 101863, 12.5, 200, 2500);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 8, 102130, 3.4, 100, 340);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 9, 200376, 2.4, 200, 480);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (617, 10, 200380, 4, 300, 1200);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (609, 2, 100870, 2.5, 5, 12.5);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (609, 3, 100890, 50, 1, 50);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (618, 1, 100860, 35, 23, 805);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (618, 2, 100861, 45.11, 50, 2255.5);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (618, 3, 100870, 45, 10, 450);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (621, 1, 100861, 45, 10, 450);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (621, 2, 100870, 2.8, 100, 280);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (615, 3, 100871, 5, 50, 250);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (608, 1, 101860, 24, 1, 24);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (608, 2, 100871, 5.6, 2, 11.2);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (609, 1, 100861, 35, 1, 35);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (606, 1, 102130, 3.4, 1, 3.4);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (605, 1, 100861, 45, 100, 4500);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (605, 2, 100870, 2.8, 500, 1400);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (605, 3, 100890, 58, 5, 290);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (605, 4, 101860, 24, 50, 1200);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (605, 5, 101863, 9, 100, 900);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (605, 6, 102130, 3.4, 10, 34);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (612, 4, 100871, 5.5, 100, 550);
INSERT INTO empresa.DETALL (COM_NUM, DETALL_NUM, PROD_NUM, PREU_VENDA, QUANTITAT, IMPORT)
VALUES (619, 4, 100871, 5.6, 50, 280);


ALTER TABLE empresa.COMANDA DROP FOREIGN KEY COMANDA_ibfk_1;
ALTER TABLE empresa.COMANDA
ADD FOREIGN KEY (CLIENT_COD) references empresa.CLIENT (CLIENT_COD) on delete cascade;

ALTER TABLE empresa.DETALL DROP FOREIGN KEY DETALL_ibfk_1;
ALTER TABLE empresa.DETALL
ADD FOREIGN KEY (COM_NUM) references empresa.COMANDA (COM_NUM) on delete cascade;




