--Mario Tirado Gallardo

--Elminar tablas---
drop table autor  cascade constraint;
drop table premio cascade constraint;
drop table agrupacion cascade constraint;
drop table componente cascade constraint;
drop table concurso cascade constraint;
drop table empresa cascade constraint;
drop table empresa_trabaja_agrupacion cascade constraint;
drop table locales cascade constraint ;
drop table miembro_puntua_agrupacion cascade constraint;
drop table miembrojurado cascade constraint;


--Script tablas, restricciones e inserts

Create table AGRUPACION(
codigo_agrupa number(4),
nombre_agrupa varchar2(50),
modalidad_agrupa varchar2(50),
codigo_concurso number(4),
dni_autor number(8),
cod_local number(4),
cod_posicion number(1)
);

Create table COMPONENTE(
DNI_componente number(8),
nombre_componente varchar2(50),
apellido_componente varchar2(50),
puesto varchar2(20),
codigo_agrupa number(4)
);

Create table LOCALES(
nombre_local varchar2(30),
direccion_local varchar2(60),
cod_local number(4),
codigo_agrupa number(4)
);

Create table EMPRESA(
nombre_empresa varchar2(50),
cif number(4),
numempleados number(2),
tipo_empresa varchar2(50)
);

Create table MIEMBROJURADO(
dni_miembro number(8),
nombre_miembro varchar2(50),
apellido_miembro varchar2(50),
puntuacion number(3)
);

Create table AUTOR(
dni_autor number(8),
nombre_autor varchar2(50),
apellido_autor varchar2(50),
codigo_agrupa number(4)
);

Create table PREMIO(
cod_posicion number(1),
posicion varchar2(30),
codigo_agrupa number(4)
);

Create table CONCURSO(
duracion number(3),
nombre_concurso varchar2(50),
codigo_concurso number(4),
codigo_agrupa number(4)
);

Create table EMPRESA_TRABAJA_AGRUPACION(
codigo_agrupa number(4),
cif number(4)
);

Create table MIEMBRO_PUNTUA_AGRUPACION(
dni_miembro number(8),
codigo_agrupa number(4)
);






--MODIFICACIONES--
--TABLA AGRUPACION--
Alter table AGRUPACION add constraint agr_mod_ck check (LOWER(modalidad_agrupa) in ('comparsa','chirigota','coro','cuarteto'));
Alter table AGRUPACION add PRIMARY KEY(codigo_agrupa);

--TABLA COMPONENTE--
Alter table COMPONENTE add constraint com_pue_ck check(LOWER(puesto)in('instrumentacion','cantante'));
Alter table COMPONENTE add PRIMARY KEY(dni_componente);

--TABLA LOCAL--
Alter table LOCALES add PRIMARY KEY(codigo_agrupa);


--TABLA EMPRESA--
Alter table EMPRESA add PRIMARY KEY(cif);
Alter table EMPRESA add constraint emp_tip_ck check(LOWER(tipo_empresa) in('maquillaje','atrezzo'));

--TABLA MIEMBROJURADO--
Alter table MIEMBROJURADO add PRIMARY KEY(dni_miembro);
Alter table MIEMBROJURADO add constraint mie_pun_ck check(puntuacion between 0 and 100);

--TABLA AUTOR--
Alter table AUTOR add PRIMARY KEY(codigo_agrupa);

--TABLA PREMIO--
Alter table PREMIO add PRIMARY KEY(codigo_agrupa);
Alter table PREMIO add constraint pos_ck check(LOWER(posicion) in ('primero','segundo','tercero','cuarto'));

--TABLA CONCURSO--
Alter table CONCURSO add PRIMARY KEY(codigo_concurso);

--TABLA EMPRESA_TRABAJA_AGRUPACION--
Alter table EMPRESA_TRABAJA_AGRUPACION add PRIMARY KEY(codigo_agrupa,cif);

--Tabla MIEMBRO_PUNTUA_AGRUPACION--
Alter table MIEMBRO_PUNTUA_AGRUPACION add PRIMARY KEY(dni_miembro,codigo_agrupa);

--FOREIGN KEYS--
Alter table CONCURSO add constraint concurso_fk FOREIGN KEY(codigo_agrupa) references AGRUPACION;
Alter table AUTOR add constraint autor_fk FOREIGN KEY(codigo_agrupa) references AGRUPACION;
Alter table LOCALES add constraint locales_fk FOREIGN KEY(codigo_agrupa) references AGRUPACION;
Alter table PREMIO add constraint agrupa_fk FOREIGN KEY(codigo_agrupa) references AGRUPACION;
Alter table MIEMBRO_PUNTUA_AGRUPACION add constraint mpaM_fk FOREIGN KEY(dni_miembro) references MIEMBROJURADO;
Alter table MIEMBRO_PUNTUA_AGRUPACION add constraint mpaA_fk FOREIGN KEY(codigo_agrupa) references AGRUPACION;
Alter table EMPRESA_TRABAJA_AGRUPACION add constraint etaA_fk FOREIGN KEY(codigo_agrupa) references AGRUPACION;
Alter table EMPRESA_TRABAJA_AGRUPACION add constraint etaE_fk FOREIGN KEY(cif) references EMPRESA;


--INSERT INTO--
--TABLA AGRUPACION--
Insert into AGRUPACION values(1111,'Los Miserables','Comparsa',1993,11111111,1234,1);
Insert into AGRUPACION values(1112,'Los Angeles Caidos','Comparsa',2002,22222222,1111,1);
Insert into AGRUPACION values(1113,'Los Templarios','Comparsa',1999,11111111,1234,3);
Insert into AGRUPACION values(1114,'Las Estaciones','Comparsa',2004,33333333,2222,3);
Insert into AGRUPACION values(1115,'El espiritu de Cadiz','Comparsa',2005,33333333,2222,1);
Insert into AGRUPACION values(1116,'Araka la Kana','Comparsa',2007,22222222,1111,1);
Insert into AGRUPACION values(1117,'Los cobardes','Comparsa',2016,11111111,1234,1);
Insert into AGRUPACION values(1118,'Los millonarios','Comparsa',2015,22222222,1111,1);
Insert into AGRUPACION values(1119,'La Chusma Selecta','Comparsa',2020,11111111,1234,2);

Insert into AGRUPACION values(2221,'Las viudas','Chirigota',1994,99999999,3333,1);
Insert into AGRUPACION values(2222,'La familia peperroni','Chirigota',1998,88888888,4444,4);
Insert into AGRUPACION values(2223,'Los yesterday','Chirigota',1999,22222222,1111,1);
Insert into AGRUPACION values(2224,'Kady City','Chirigota',1997,22222222,1111,4);
Insert into AGRUPACION values(2225,'Los Enteraos','Chirigota',2009,77777777,5555,3);
Insert into AGRUPACION values(2226,'Lo que diga mi Mujer','Chirigota',2004,77777777,5555,1);
Insert into AGRUPACION values(2227,'Si me pongo pesao me lo dices','Chirigota',2016,77777777,5555,1);
Insert into AGRUPACION values(2228,'No te vayas todavía','Chirigota',2017,66666666,6666,2);
Insert into AGRUPACION values(2229,'Ahora es cuando se está bien aquí','Chirigota',2015,77777777,5555,3);

Insert into AGRUPACION values(2230,'Brigada Amarilla','Cuarteto',2019,55555555,7777,1);
Insert into AGRUPACION values(2231,'La Gaditana','Coro',2001,44444444,8888,1);
Insert into AGRUPACION values(2232,'El equipo A minúscula','Cuarteto',2018,55555555,7777,1);



--Tabla autor--
Insert into AUTOR values(11111111,'Antonio','Martinez Ares',1111);
Insert into AUTOR values(22222222,'Juan Carlos','Aragón',1112);
Insert into AUTOR values(11111111,'Antonio','Martinez Ares',1113);
Insert into AUTOR values(33333333,'Tino','Tovar',1114);
Insert into AUTOR values(33333333,'Tino','Tovar',1115);
Insert into AUTOR values(22222222,'Juan Carlos','Aragón',1116);
Insert into AUTOR values(11111111,'Antonio','Ares',1117);
Insert into AUTOR values(22222222,'Juan Carlos','Aragón',1118);
Insert into AUTOR values(11111111,'Antonio','Martinez Ares',1119);

Insert into AUTOR values(99999999,'Noly','Alba',2221);
Insert into AUTOR values(88888888,'Manolo','Santander',2222);
Insert into AUTOR values(22222222,'Juan Carlos','Aragón',2223);
Insert into AUTOR values(22222222,'Juan Carlos','Aragón',2224);
Insert into AUTOR values(77777777,'Jose Luis','Selu',2225);
Insert into AUTOR values(77777777,'Jose Luis','Selu',2226);
Insert into AUTOR values(77777777,'Jose Luis','Selu',2227);
Insert into AUTOR values(66666666,'Antonio','Bizcocho',2228);
Insert into AUTOR values(77777777,'Jose Luis','Selu',2229);

Insert into AUTOR values(55555555,'Manuel','Morera',2230);
Insert into AUTOR values(44444444,'Julio','Pardo',2231);
Insert into AUTOR values(55555555,'Manuel','Morera',2232);



--Tabla COMPONENTE--
Insert Into COMPONENTE values(11111111,'Carlos','Brihuega','Cantante',1111);
Insert Into COMPONENTE values(11111112,'Ángel','Subiela','Cantante',1111);
Insert Into COMPONENTE values(11111113,'Edu','Brihuega','Instrumentacion',1111);

Insert Into COMPONENTE values(11111114,'Jaime','García','Cantante',1112);
Insert Into COMPONENTE values(11111115,'Mario','Tirado','Cantante',1112);
Insert Into COMPONENTE values(11111116,'Antonio','Gómez','Cantante',1112);

Insert Into COMPONENTE values(11111117,'Carmen','Fernandez','Instrumentacion',1113);
Insert Into COMPONENTE values(11111118,'Adrián','Gómez','Cantante',1113);
Insert Into COMPONENTE values(11111119,'Francisco','Alba','Instrumentacion',1113);

Insert Into COMPONENTE values(11111121,'Lucía','Gónzalez','Cantante',1114);
Insert Into COMPONENTE values(11111122,'Lola','Gómez','Instrumentacion',1114);
Insert Into COMPONENTE values(11111123,'Carlos','García','Cantante',1114);

Insert Into COMPONENTE values(11111124,'Lucas','Hermoso','Cantante',1115);
Insert Into COMPONENTE values(11111125,'María','Pelae','Cantante',1115);
Insert Into COMPONENTE values(11111126,'Antonio','López','Instrumentacion',1115);

Insert Into COMPONENTE values(11111127,'Kike','García','Cantante',1116);
Insert Into COMPONENTE values(11111128,'Rafael','Gallardo','Instrumentacion',1116);
Insert Into COMPONENTE values(11111129,'José','Gómez','Cantante',1116);

Insert Into COMPONENTE values(11111130,'Manolo','Santander','Instrumentacion',1117);
Insert Into COMPONENTE values(11111131,'Juan','Aragón','Cantante',1117);
Insert Into COMPONENTE values(11111132,'Alejandro','Vazquez','Cantante',1117);

Insert Into COMPONENTE values(11111133,'Joaquín','García','Cantante',1118);
Insert Into COMPONENTE values(11111134,'Miguel','Lopera','Cantante',1118);
Insert Into COMPONENTE values(11111135,'Guillermo','Escribano','Instrumentacion',1118);

Insert Into COMPONENTE values(11111136,'Antonio','García','Instrumentacion',1119);
Insert Into COMPONENTE values(11111137,'Alejandro','Tirado','Cantante',1119);
Insert Into COMPONENTE values(11111138,'David','','Cantante',1119);

Insert Into COMPONENTE values(11111139,'Jose','Robles','Cantante',2221);
Insert Into COMPONENTE values(11111141,'Javier','Gómez','Cantante',2221);
Insert Into COMPONENTE values(11111142,'María','Lara','Instrumentacion',2221);

Insert Into COMPONENTE values(11111143,'Lourdes','Otero','Cantante',2222);
Insert Into COMPONENTE values(11111144,'Alejandro','Montoya','Instrumentacion',2222);
Insert Into COMPONENTE values(11111145,'Andrés','García','Cantante',2222);

Insert Into COMPONENTE values(11111146,'Javier','Gómez','Instrumentacion',2223);
Insert Into COMPONENTE values(11111147,'Iván','Macías','Cantante',2223);
Insert Into COMPONENTE values(11111148,'Antonio','Botello','Cantante',2223);

Insert Into COMPONENTE values(11111149,'Mario','Gallardo','Cantante',2224);
Insert Into COMPONENTE values(11111150,'Javier','García','Cantante',2224);
Insert Into COMPONENTE values(11111151,'Jaime','Tirado','Instrumentacion',2224);

Insert Into COMPONENTE values(11111152,'Alejandro','Ponce','Cantante',2225);
Insert Into COMPONENTE values(11111153,'Alberto','Gómez','Instrumentacion',2225);
Insert Into COMPONENTE values(11111154,'Jesús','Barrios','Cantante',2225);

Insert Into COMPONENTE values(11111155,'José','Cerdo','Cantante',2226);
Insert Into COMPONENTE values(11111156,'Manuel','Cervera','Instrumentacion',2226);
Insert Into COMPONENTE values(11111157,'Alejandro','Padilla','Cantante',2226);

Insert Into COMPONENTE values(11111158,'María','Gómez','Instrumentacion',2227);
Insert Into COMPONENTE values(11111159,'Carlos','García','Cantante',2227);
Insert Into COMPONENTE values(11111160,'Lourdes','Domínguez','Cantante',2227);

Insert Into COMPONENTE values(11111161,'Adrián','Carmona','Cantante',2228);
Insert Into COMPONENTE values(11111162,'Miguel','Cervantes','Cantante',2228);
Insert Into COMPONENTE values(11111163,'José','García','Instrumentacion',2228);

Insert Into COMPONENTE values(11111164,'Ángel','Brihuega','Cantante',2229);
Insert Into COMPONENTE values(11111165,'Miriam','Alonso','Instrumentacion',2229);
Insert Into COMPONENTE values(11111166,'Mario','Gómez','Cantante',2229);

Insert Into COMPONENTE values(11111167,'Carlos','Mení','Cantante',2230);
Insert Into COMPONENTE values(11111168,'Iván','Romero','Cantante',2230);
Insert Into COMPONENTE values(11111169,'Jaime','Altozano','Cantante',2230);

Insert Into COMPONENTE values(11111170,'Julio','Pardo','Cantante',2231);
Insert Into COMPONENTE values(11111171,'Marcos','Suárez','Cantante',2231);
Insert Into COMPONENTE values(11111172,'Luis','Mejías','Cantante',2231);

Insert Into COMPONENTE values(11111173,'Manuel','Morera','Cantante',2232);
Insert Into COMPONENTE values(11111174,'Alfonso','Rojas','Cantante',2232);
Insert Into COMPONENTE values(11111175,'Benjamín','Esteban','Cantante',2232);


--Locales--
Insert Into LOCALES values('Peña Coplas','PitoCaña/1',1234,1111);
Insert Into LOCALES values('Peña Sardinas','Serpentina/4',1111,1112);
Insert Into LOCALES values('Peña Coplas','PitoCaña/1',1234,1113);
Insert Into LOCALES values('Bar La agrupacion','Falla/18',2222,1114);
Insert Into LOCALES values('Bar La agrupacion','Falla/18',2222,1115);
Insert Into LOCALES values('Peña Sardinas','Serpentina/4',1111,1116);
Insert Into LOCALES values('Peña Coplas','PitoCaña/1',1234,1117);
Insert Into LOCALES values('Peña Sardinas','Serpentina/4',1111,1118);
Insert Into LOCALES values('Peña Coplas','PitoCaña/1',1234,1119);


Insert Into LOCALES values('Peña papelillos','Chirigoton/29',3333,2221);
Insert Into LOCALES values('Bar Manolo','Viñero/11',4444,2222);
Insert Into LOCALES values('Peña Sardinas','Serpentina/4',1111,2223);
Insert Into LOCALES values('Peña Sardinas','Serpentina/4',1111,2224);
Insert Into LOCALES values('Peña Eterno','Cajonaso/56',5555,2225);
Insert Into LOCALES values('Peña Eterno','Cajonaso/56',5555,2226);
Insert Into LOCALES values('Peña Eterno','Cajonaso/56',5555,2227);
Insert Into LOCALES values('Bar Conchi','Sevilla/13',6666,2228);
Insert Into LOCALES values('Peña Eterno','Cajonaso/56',5555,2229);
Insert Into LOCALES values('Peña PitoCaña','Cajonaso/56',7777,2230);
Insert Into LOCALES values('La batuta','Laud/34',8888,2231);
Insert Into LOCALES values('Peña PitoCaña','Cajonaso/56',7777,2232);

--PREMIO--
Insert into PREMIO values(1,'Primero',1111);
Insert into PREMIO values(1,'Primero',1112);
Insert into PREMIO values(3,'Tercero',1113);
Insert into PREMIO values(3,'Tercero',1114);
Insert into PREMIO values(1,'Primero',1115);
Insert into PREMIO values(1,'Primero',1116);
Insert into PREMIO values(1,'Primero',1117);
Insert into PREMIO values(1,'Primero',1118);
Insert into PREMIO values(2,'Segundo',1119);
Insert into PREMIO values(1,'Primero',2221);
Insert into PREMIO values(4,'Cuarto',2222);
Insert into PREMIO values(1,'Primero',2223);
Insert into PREMIO values(4,'Cuarto',2224);
Insert into PREMIO values(3,'Tercero',2225);
Insert into PREMIO values(1,'Primero',2226);
Insert into PREMIO values(1,'Primero',2227);
Insert into PREMIO values(2,'Segundo',2228);
Insert into PREMIO values(3,'Tercero',2229);
Insert into PREMIO values(1,'Primero',2230);
Insert into PREMIO values(1,'Primero',2231);
Insert into PREMIO values(1,'Primero',2232);

--CONCURSO--
Insert into CONCURSO values(30,'COAC',1993,1111);
Insert into CONCURSO values(37,'COAC',2002,1112);
Insert into CONCURSO values(30,'COAC',1999,1113);
Insert into CONCURSO values(31,'COAC',2004,1114);
Insert into CONCURSO values(29,'COAC',2005,1115);
Insert into CONCURSO values(32,'COAC',2007,1116);
Insert into CONCURSO values(36,'COAC',2016,1117);
Insert into CONCURSO values(38,'COAC',2015,1118);
Insert into CONCURSO values(41,'COAC',2020,1119);

Insert into CONCURSO values(26,'COAC',1994,2221);
Insert into CONCURSO values(30,'COAC',1998,2222);
Insert into CONCURSO values(30,'COAC',99,2223);
Insert into CONCURSO values(37,'COAC',1997,2224);
Insert into CONCURSO values(30,'COAC',2009,2225);
Insert into CONCURSO values(31,'COAC',04,2226);
Insert into CONCURSO values(36,'COAC',16,2227);
Insert into CONCURSO values(37,'COAC',17,2228);
Insert into CONCURSO values(38,'COAC',15,2229);
Insert into CONCURSO values(36,'COAC',2019,2230);
Insert into CONCURSO values(37,'COAC',2001,2231);
Insert into CONCURSO values(38,'COAC',2018,2232);

--EMPRESA--
Insert into EMPRESA values('Maquillaje LOLA',1111,15,'Maquillaje');
Insert into EMPRESA values('Decorados García',2222,34,'Atrezzo');
Insert into EMPRESA values('AsMake',3333,10,'Maquillaje');
Insert into EMPRESA values('ViajeAtuImaginacion',4444,46,'Atrezzo');
Insert into EMPRESA values('MakeLUp',5555,9,'Maquillaje');
Insert into EMPRESA values('ContextoIn',6666,21,'Atrezzo');
Insert into EMPRESA values('ColoretesDorados',7777,11,'Maquillaje');
Insert into EMPRESA values('CobraVida',8888,25,'Atrezzo');
Insert into EMPRESA values('BlancoYNegro',9999,40,'Maquillaje');


--EMPRESA_TRABAJA_AGRUPACION--
Insert into EMPRESA_TRABAJA_AGRUPACION values(1111,1111);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1111,2222);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1112,7777);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1112,8888);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1113,3333);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1113,4444);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1114,5555);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1114,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1115,1111);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1115,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1116,3333);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1116,8888);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1117,9999);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1117,2222);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1118,1111);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1118,2222);

Insert into EMPRESA_TRABAJA_AGRUPACION values(1119,9999);
Insert into EMPRESA_TRABAJA_AGRUPACION values(1119,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2221,3333);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2221,2222);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2222,5555);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2222,8888);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2223,1111);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2223,4444);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2224,7777);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2224,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2225,3333);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2225,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2226,5555);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2226,8888);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2227,7777);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2227,2222);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2228,5555);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2228,2222);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2229,1111);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2229,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2230,7777);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2230,6666);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2231,5555);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2231,8888);

Insert into EMPRESA_TRABAJA_AGRUPACION values(2232,1111);
Insert into EMPRESA_TRABAJA_AGRUPACION values(2232,4444);

--MIEMBROJURADO--
Insert into MIEMBROJURADO values(11111111,'Mario','Tirado',70);
Insert into MIEMBROJURADO values(11111112,'Lucas','Sevilla',67);
Insert into MIEMBROJURADO values(11111113,'Ángela','Martínez',40);
Insert into MIEMBROJURADO values(11111114,'Jesús','Bienvenido',100);
Insert into MIEMBROJURADO values(11111115,'José','López',10);
Insert into MIEMBROJURADO values(11111116,'Adrián','Huelva',38);
Insert into MIEMBROJURADO values(11111117,'Marcos','Garrido',40);
Insert into MIEMBROJURADO values(11111118,'Víctor','Rayo',98);
Insert into MIEMBROJURADO values(11111119,'Miriam','Puerto',56);
Insert into MIEMBROJURADO values(11111120,'Eduardo','Blanco',34);
Insert into MIEMBROJURADO values(11111121,'Luis','Hidalgo',51);




--MIEMBRO_PUNTUA_AGRUPACION--
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111111,1111);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,1111);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111113,1111);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,1112);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,1112);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111121,1112);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,1113);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111113,1113);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111119,1113);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,1114);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,1114);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111111,1114);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111120,1115);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111114,1115);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111111,1115);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,1116);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111115,1116);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,1116);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111120,1117);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111121,1117);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,1117);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111111,1118);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,1118);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111113,1118);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111114,1119);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111115,1119);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,1119);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,2221);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111118,2221);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111119,2221);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111120,2222);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111119,2222);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111118,2222);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111114,2223);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111115,2223);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,2223);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,2224);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,2224);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,2224);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,2225);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,2225);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111119,2225);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111111,2226);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,2226);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111113,2226);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111119,2227);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111117,2227);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,2227);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111115,2229);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,2229);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111119,2229);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111114,2230);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111113,2230);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111118,2230);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111111,2231);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111115,2231);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111118,2231);

Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111116,2232);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111112,2232);
Insert into MIEMBRO_PUNTUA_AGRUPACION values(11111114,2232);

COMMIT;



--PROCEDIMIENTOS--
--1--
create or replace procedure busca_autor(nombre agrupacion.nombre_agrupa%TYPE) as

cursor busca_autor is
Select AT.nombre_autor, at.apellido_autor from AUTOR AT, AGRUPACION AGR
where AGR.DNI_AUTOR=AT.DNI_AUTOR and LOWER(AGR.NOMBRE_AGRUPA)=LOWER(nombre) group by AT.NOMBRE_AUTOR, at.apellido_autor;

BEGIN

for contador in busca_autor loop
DBMS_OUTPUT.put_line(contador.nombre_autor);
end loop;
EXCEPTION
	WHEN NO_DATA_FOUND THEN 
		dbms_output.put_line('No se encuentra ninguna fila');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Se ha recuperado más de una fila');

END;
/
--2--
create or replace procedure busca_componente(agrup agrupacion.nombre_agrupa%type)as

cursor ver_componente is
Select com.nombre_componente, com.apellido_componente, com.puesto 
from COMPONENTE com, AGRUPACION AGR
where LOWER(AGR.nombre_agrupa)=LOWER(agrup) and AGR.codigo_agrupa=com.codigo_agrupa;

BEGIN

for registro in ver_componente loop
dbms_output.put_line('Nombre: ' || registro.nombre_componente || ' apellido: ' ||registro.apellido_componente || ' puesto: ' || registro.puesto);
end loop;
EXCEPTION
	WHEN NO_DATA_FOUND THEN 
		dbms_output.put_line('No se encuentra ninguna fila');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Se ha recuperado más de una fila');

END;
/


--FUNCIONES--
--1--
Create or replace function puntuacion_agrupa(nombre agrupacion.nombre_agrupa%type) return number as
suma number;
cursor suma_puntuacion is
Select sum(jurado.puntuacion)  from miembrojurado jurado, miembro_puntua_agrupacion mpa, agrupacion agr
where agr.codigo_agrupa=mpa.codigo_agrupa and mpa.dni_miembro=jurado.dni_miembro and LOWER(agr.nombre_agrupa) like nombre;

Begin

open suma_puntuacion;
loop
fetch suma_puntuacion into suma;

exit when suma_puntuacion%notfound;
end loop;
close suma_puntuacion;
return suma;
EXCEPTION
	WHEN NO_DATA_FOUND THEN 
		dbms_output.put_line('No se encuentra ninguna fila');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Se ha recuperado más de una fila');
end;
/

--2--
Create or replace function maxima_puntuacion(agrnombre agrupacion.nombre_agrupa%type) return varchar as 
agrpunt miembrojurado.puntuacion%type;

cursor maxima_puntuacion is
Select max(puntuacion) from agrupacion agr, miembrojurado mj, miembro_puntua_agrupacion mpa
where agr.codigo_agrupa=mpa.codigo_agrupa and mpa.dni_miembro=mj.dni_miembro and LOWER(agr.nombre_agrupa) like LOWER(agrnombre);

BEGIN

open maxima_puntuacion;
loop
fetch maxima_puntuacion into agrpunt;
exit when maxima_puntuacion%notfound;
end loop;
return agrpunt;
EXCEPTION
	WHEN NO_DATA_FOUND THEN 
		dbms_output.put_line('No se encuentra ninguna fila');
    WHEN TOO_MANY_ROWS THEN
        dbms_output.put_line('Se ha recuperado más de una fila');
	
end;
/


--PRINCIPAL--
DECLARE
SUMA NUMBER;
VALORMAX NUMBER;
BEGIN
busca_autor('&nombre');
busca_componente('&comp');
select puntuacion_agrupa('&nombrepuntuacion') into suma from dual;
select maxima_puntuacion('&nombreagrupacion') into valormax from dual;
end;
/




