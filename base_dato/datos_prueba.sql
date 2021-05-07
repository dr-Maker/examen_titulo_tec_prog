use db_tienda_virtual;

/** Insert Producto **/


SELECT * FROM categoria Where id_category = 101

SELECT * FROM producto

INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date) VALUES 
				    (101, 'Poleron Rojo','VANS','M', 10, 15000, GETDATE());
INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date) VALUES 
				    (101, 'Poleron Azul','VANS','L', 10, 15000, GETDATE());
INSERT INTO producto(id_category, name_product,brand, size,stock, price, arribal_date) VALUES 
				    (101, 'Poleron Amarillo','VANS','XL', 10, 15000, GETDATE());


/** Insert CANASTA **/



					
INSERT INTO lista_productos(producto_id, cantidad) values(1000001, 1)
INSERT INTO lista_productos(producto_id, cantidad) values(1000002, 1)
INSERT INTO lista_productos(producto_id, cantidad) values(1000003, 1)
INSERT INTO lista_productos(producto_id, cantidad) values(1000004, 1)
INSERT INTO lista_productos(producto_id, cantidad) values(1000005, 1)



INSERT INTO region(nombre_region) VALUES('Arica y Parinacota');
INSERT INTO region(nombre_region) VALUES('Tarapac�');
INSERT INTO region(nombre_region) VALUES('Antofagasta');
INSERT INTO region(nombre_region) VALUES('Atacama');
INSERT INTO region(nombre_region) VALUES('Coquimbo');
INSERT INTO region(nombre_region) VALUES('Valparaiso');
INSERT INTO region(nombre_region) VALUES('Metropolitana de Santiago');
INSERT INTO region(nombre_region) VALUES('Libertador General Bernardo O Higgins');
INSERT INTO region(nombre_region) VALUES('Maule');
INSERT INTO region(nombre_region) VALUES('�uble');
INSERT INTO region(nombre_region) VALUES('Biob�o');
INSERT INTO region(nombre_region) VALUES('La Araucan�a');
INSERT INTO region(nombre_region) VALUES('Los R�os');
INSERT INTO region(nombre_region) VALUES('Los Lagos');
INSERT INTO region(nombre_region) VALUES('Ays�n del General Carlos Ib��ez del Campo');
INSERT INTO region(nombre_region) VALUES('Magallanes y de la Ant�rtica Chilena');

select * from region



INSERT INTO provincia(nombre_provincia, id_region) values ('Arica',1);
INSERT INTO provincia(nombre_provincia, id_region) values ('Parinacota',1);
INSERT INTO provincia(nombre_provincia, id_region) values ('Iquique',2);
INSERT INTO provincia(nombre_provincia, id_region) values ('El Tamarugal',2);
INSERT INTO provincia(nombre_provincia, id_region) values ('Tocopilla',3);
INSERT INTO provincia(nombre_provincia, id_region) values ('El Loa',3);
INSERT INTO provincia(nombre_provincia, id_region) values ('Antofagasta',3);
INSERT INTO provincia(nombre_provincia, id_region) values ('Cha�aral',4);
INSERT INTO provincia(nombre_provincia, id_region) values ('Copiap�',4);
INSERT INTO provincia(nombre_provincia, id_region) values ('Huasco',4);
INSERT INTO provincia(nombre_provincia, id_region) values ('Elqui',5);
INSERT INTO provincia(nombre_provincia, id_region) values ('Limar�',5);
INSERT INTO provincia(nombre_provincia, id_region) values ('Choapa',5);
INSERT INTO provincia(nombre_provincia, id_region) values ('Petorca',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('Los Andes',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('San Felipe de Aconcagua',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('Quillota',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('Valparaiso',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('San Antonio',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('Isla de Pascua',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('Marga Marga',6);
INSERT INTO provincia(nombre_provincia, id_region) values ('Chacabuco',7);
INSERT INTO provincia(nombre_provincia, id_region) values ('Santiago',7);
INSERT INTO provincia(nombre_provincia, id_region) values ('Cordillera',7);
INSERT INTO provincia(nombre_provincia, id_region) values ('Maipo',7);
INSERT INTO provincia(nombre_provincia, id_region) values ('Melipilla',7);
INSERT INTO provincia(nombre_provincia, id_region) values ('Talagante',7);
INSERT INTO provincia(nombre_provincia, id_region) values ('Cachapoal',8);
INSERT INTO provincia(nombre_provincia, id_region) values ('Colchagua',8);
INSERT INTO provincia(nombre_provincia, id_region) values ('Cardenal Caro',8);
INSERT INTO provincia(nombre_provincia, id_region) values ('Curic�',9);
INSERT INTO provincia(nombre_provincia, id_region) values ('Talca',9);
INSERT INTO provincia(nombre_provincia, id_region) values ('Linares',9);
INSERT INTO provincia(nombre_provincia, id_region) values ('Cauquenes',9);
INSERT INTO provincia(nombre_provincia, id_region) values ('Diguill�n',10);
INSERT INTO provincia(nombre_provincia, id_region) values ('Itata',10);
INSERT INTO provincia(nombre_provincia, id_region) values ('Punilla',10);
INSERT INTO provincia(nombre_provincia, id_region) values ('Bio Bio',11);
INSERT INTO provincia(nombre_provincia, id_region) values ('Concepci�n',11);
INSERT INTO provincia(nombre_provincia, id_region) values ('Arauco',11);
INSERT INTO provincia(nombre_provincia, id_region) values ('Malleco',12);
INSERT INTO provincia(nombre_provincia, id_region) values ('Caut�n',12);
INSERT INTO provincia(nombre_provincia, id_region) values ('Valdivia',13);
INSERT INTO provincia(nombre_provincia, id_region) values ('Ranco',13);
INSERT INTO provincia(nombre_provincia, id_region) values ('Osorno',14);
INSERT INTO provincia(nombre_provincia, id_region) values ('Llanquihue',14);
INSERT INTO provincia(nombre_provincia, id_region) values ('Chiloe',14);
INSERT INTO provincia(nombre_provincia, id_region) values ('Palena',14);
INSERT INTO provincia(nombre_provincia, id_region) values ('Coyhaique',15);
INSERT INTO provincia(nombre_provincia, id_region) values ('Ays�n',15);
INSERT INTO provincia(nombre_provincia, id_region) values ('General Carrera',15);
INSERT INTO provincia(nombre_provincia, id_region) values ('Capit�n Prat',15);
INSERT INTO provincia(nombre_provincia, id_region) values ('�ltima Esperanza',16);
INSERT INTO provincia(nombre_provincia, id_region) values ('Magallanes',16);
INSERT INTO provincia(nombre_provincia, id_region) values ('Tierra del Fuego',16);
INSERT INTO provincia(nombre_provincia, id_region) values ('Ant�rtica Chilena',16);


select * from provincia


INSERT INTO comuna(nombre_comuna, id_provincia) values ('Arica',1);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Camarones',1);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('General Lagos',2);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Putre',2);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Alto Hospicio',3);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Iquique',3);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cami�a',4);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Colchane',4);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Huara',4);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pica',4);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pozo Almonte',4);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tocopilla',5);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mar�a Elena',5);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Calama',6);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ollague',6);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Pedro de Atacama',6);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Antofagasta',7);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mejillones',7);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Sierra Gorda',7);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Taltal',7);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cha�aral',8);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Diego de Almagro',8);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Copiap�',9);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Caldera',9);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tierra Amarilla',9);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Vallenar',10);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Alto del Carmen',10);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Freirina',10);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Huasco',10);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Serena',11);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Coquimbo',11);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Andacollo',11);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Higuera',11);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Paihuano',11);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Vicu�a',11);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ovalle',12);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Combarbal�',12);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Monte Patria',12);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Punitaqui',12);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�o Hurtado',12);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Illapel',13);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Canela',13);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los Vilos',13);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Salamanca',13);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Ligua',14);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cabildo',14);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Zapallar',14);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Papudo',14);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Petorca',14);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los Andes',15);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Esteban',15);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Calle Larga',15);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Rinconada',15);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Felipe',16);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Llaillay',16);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Putaendo',16);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Santa Mar�a',16);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Catemu',16);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Panquehue',16);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quillota',17);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Cruz',17);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Calera',17);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Nogales',17);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Hijuelas',17);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Valpara�so',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Vi�a del Mar',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Conc�n',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quintero',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puchuncav�',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Casablanca',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Juan Fernández',18);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Antonio',19);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cartagena',19);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('El Tabo',19);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('El Quisco',19);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Algarrobo',19);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Santo Domingo',19);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Isla de Pascua',20);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quilpu�',21);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Limache',21);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Olmu�',21);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Villa Alemana',21);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Colina',22);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lampa',22);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tiltil',22);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Santiago',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Vitacura',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Ram�n',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Miguel',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Joaqu�n',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Renca',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Recoleta',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quinta Normal',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quilicura',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pudahuel',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Providencia',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pe�alol�n',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pedro Aguirre Cerda',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('�u�oa',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Maip�',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Macul',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lo Prado',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lo Espejo',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lo Barnechea',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Las Condes',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Reina',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Pintana',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Granja',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Florida',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Cisterna',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Independencia',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Huechuraba',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Estaci�n Central',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('El Bosque',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Conchal�',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cerro Navia',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cerrillos',23);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puente Alto',24);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Jos� de Maipo',24);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pirque',24);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Bernardo',25);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Buin',25);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Paine',25);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Calera de Tango',25);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Melipilla',26);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Alhu�',26);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curacav�',26);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mar�a Pinto',26);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Pedro',26);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Isla de Maipo',27);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('El Monte',27);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Padre Hurtado',27);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pe�aflor',27);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Talagante',27);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Codegua',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Co�nco',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Coltauco',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Do�ihue',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Graneros',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Las Cabras',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Machal�',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Malloa',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mostazal',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Olivar',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Peumo',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pichidegua',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quinta de Tilcoco',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Rancagua',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Rengo',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Requ�noa',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Vicente de Tagua Tagua',28);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ch�pica',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chimbarongo',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lolol',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Nancagua',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Palmilla',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Peralillo',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Placilla',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pumanque',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Fernando',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Santa Cruz',29);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Estrella',30);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Litueche',30);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Marchig�e',30);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Navidad',30);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Paredones',30);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pichilemu',30);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curic�',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Huala��',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Licant�n',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Molina',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Rauco',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Romeral',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Sagrada Familia',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Teno',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Vichuqu�n',31);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Talca',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Clemente',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pelarco',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pencahue',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Maule',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Rafael',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curepto',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Constituci�n',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Empedrado',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�o Claro',32);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Linares',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Javier',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Parral',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Villa Alegre',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Longav�',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Colb�n',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Retiro',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Yerbas Buenas',33);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cauquenes',34);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chanco',34);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pelluhue',34);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Bulnes',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chill�n',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chill�n Viejo',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('El Carmen',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pemuco',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pinto',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quill�n',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Ignacio',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Yungay',35);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cobquecura',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Coelemu',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ninhue',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Portezuelo',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quirihue',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�nquil',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Treguaco',36);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Carlos',37);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Coihueco',37);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Nicol�s',37);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('�iqu�n',37);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Fabi�n',37);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Alto Biob�o',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Antuco',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cabrero',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Laja',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los �ngeles',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mulch�n',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Nacimiento',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Negrete',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quilaco',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quilleco',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Rosendo',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Santa B�rbara',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tucapel',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Yumbel',38);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Concepci�n',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Coronel',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chiguayante',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Florida',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Hualp�n',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Hualqui',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lota',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Penco',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Pedro de La Paz',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Santa Juana',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Talcahuano',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tom�',39);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Arauco',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ca�ete',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Contulmo',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curanilahue',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lebu',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los �lamos',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tir�a',40);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Angol',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Collipulli',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curacaut�n',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ercilla',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lonquimay',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los Sauces',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lumaco',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pur�n',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Renaico',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Traigu�n',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Victoria',41);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Temuco',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Carahue',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cholchol',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cunco',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curarrehue',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Freire',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Galvarino',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Gorbea',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lautaro',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Loncoche',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Melipeuco',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Nueva Imperial',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Padre Las Casas',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Perquenco',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Pitrufqu�n',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puc�n',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Saavedra',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Teodoro Schmidt',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tolt�n',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Vilc�n',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Villarrica',42);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Valdivia',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Corral',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lanco',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los Lagos',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mafil',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Mariquina',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Paillaco',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Panguipulli',43);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('La Uni�n',44);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Futrono',44);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lago Ranco',44);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�o Bueno',44);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Osorno',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puerto Octay',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Purranque',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puyehue',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�o Negro',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Juan de la Costa',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Pablo',45);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Calbuco',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cocham�',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Fresia',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Frutillar',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Llanquihue',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Los Muermos',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Maull�n',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puerto Montt',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puerto Varas',46);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ancud',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Castro',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chonchi',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Curaco de V�lez',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Dalcahue',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Puqueld�n',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Queil�n',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quell�n',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quemchi',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Quinchao',47);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chait�n',48);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Futaleuf�',48);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Hualaihu�',48);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Palena',48);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Lago Verde',49);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Coihaique',49);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ays�n',50);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cisnes',50);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Guaitecas',50);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�o Ib��ez',51);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Chile Chico',51);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cochrane',52);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('O Higgins',52);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Tortel',52);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Natales',53);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Torres del Paine',53);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Laguna Blanca',54);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Punta Arenas',54);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('R�o Verde',54);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('San Gregorio',54);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Porvenir',55);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Primavera',55);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Timaukel',55);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Cabo de Hornos',56);
INSERT INTO comuna(nombre_comuna, id_provincia) values ('Ant�rtica',56);

select * from comuna

INSERT INTO sexo(nombre_sexo) values ('Femenino');
INSERT INTO sexo(nombre_sexo) values ('Masculino');

select * from sexo

SELECT * from categoria

SELECT * from marca
INSERT INTO marca(brand) values ('Adidas');
INSERT INTO marca(brand) values ('Nike');
INSERT INTO marca(brand) values ('Umbro');
INSERT INTO marca(brand) values ('Under Armour');
INSERT INTO marca(brand) values ('New Balance');
INSERT INTO marca(brand) values ('Brooks');


INSERT INTO tipo_talla(tipo) values ('talla en letras');
INSERT INTO tipo_talla(tipo) values ('talla de zapatillas');

SELECT * from tipo_talla

INSERT INTO sizesProduct(id_tipo, size) values(1, 'XXS')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'XS')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'S')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'M')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'L')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'XL')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'XXL')
INSERT INTO sizesProduct(id_tipo, size) values(1, 'N/A')

select * from sizesProduct