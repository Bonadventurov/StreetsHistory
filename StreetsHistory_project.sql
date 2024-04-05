pragma foreign_keys = on;

DROP TABLE IF EXISTS Countries;
DROP TABLE IF EXISTS Cities;
DROP TABLE IF EXISTS Regions;
DROP TABLE IF EXISTS Streets;
DROP TABLE IF EXISTS photo_countries;
DROP TABLE IF EXISTS photo_cities;
DROP TABLE IF EXISTS photo_regions;
DROP TABLE IF EXISTS photo_streets;
DROP TABLE IF EXISTS events_countries;
DROP TABLE IF EXISTS events_cities;
DROP TABLE IF EXISTS events_regions;
DROP TABLE IF EXISTS events_streets;



CREATE TABLE Countries(ID integer primary key, 
					   name_country text);
					   
CREATE TABLE Cities(ID INTEGER PRIMARY KEY, 
					ID_Country INTEGER, 
					name_city text,
				    foreign key (ID_Country) references Countries(ID));

CREATE TABLE Regions(ID INTEGER primary key,

					 ID_City INTEGER, 
					 name_region text,
					 foreign key (ID_City) references Cities(ID));

CREATE TABLE Streets(ID INTEGER primary key,

					 ID_Region INTEGER,
					 name_street text,
					 foreign key (ID_Region) references Regions(ID));

				
					
CREATE table photo_countries(ID_Country integer,
							 ID integer primary key,
							 photo_country text,
							 foreign key (ID_Country) references Countries(ID));

CREATE table photo_cities(ID_City integer,
						  ID integer primary key,
						  photo_city text,
         				  foreign key (ID_City) references Cities(ID));

CREATE table photo_regions(ID_Region integer,
						   ID integer primary key,
						   photo_region text,
						   foreign key (ID_Region) references Regions(ID));

CREATE table photo_streets(ID_Street integer,
						   ID integer primary key,
						   photo_street text,
						   photo_date date,
						   camera_angle text,
						   foreign key (ID_Street) references Streets(ID));
						  
						  
						  						  	  
CREATE table events_countries(ID_Country integer,
							  ID integer primary key,
							  foreign key (ID_Country) references Countries(ID));

CREATE table events_cities(ID_City  integer,
						   ID integer primary key,
				   		   foreign key (ID_City) references Cities(ID));

CREATE table events_regions(ID_Region integer,
                            ID integer primary key,  
					  		foreign key (ID_Region) references Regions(ID));			
					  	
CREATE table events_streets(ID_Street integer, 
							ID integer primary key,
						    old_name text,                            --прежнее имя
							date_naming integer,                        --дата наименования
							date_renaming integer,                      --дата переименования
							reason_name text,                        --почему так назвали
							distance integer,                            --длина улицы
							adjoin_streets text,                     --примыкающие улицы
 							across_street text,                      --названия пересекающих улиц
 							foreign key (ID_Street) references Streets(ID));
				  		   

 						
insert into Countries(name_country) values ('Россия');
insert into Cities(ID_Country, name_city) values ((select ID from Countries where name_country = 'Россия'),'Москва');
insert into Regions(ID_City, name_region) values ((select ID from Cities where name_city = 'Москва'),'Академический');
insert into Streets(ID_Region, name_street) values ((select ID from Regions where name_region = 'Академический'), 'проспект 60-летия Октября'),
													((select ID from Regions where name_region = 'Академический'), 'Большая Черёмушкинския улица'), 
													((select ID from Regions where name_region = 'Академический'), 'улица Вавилова'), 
													((select ID from Regions where name_region = 'Академический'), 'улица Винокурова'),
													((select ID from Regions where name_region = 'Академический'), 'улица Гримау'),
													((select ID from Regions where name_region = 'Академический'), 'улица Ферсмана'),
													((select ID from Regions where name_region = 'Академический'), 'улица Дмитрия Ульянова'),
													((select ID from Regions where name_region = 'Академический'), 'улица Губкина'),
													((select ID from Regions where name_region = 'Академический'), 'улица Ивана Бабушкина'),
													((select ID from Regions where name_region = 'Академический'), 'улица Кедрова'),
													((select ID from Regions where name_region = 'Академический'), 'улица Карьер'),
													((select ID from Regions where name_region = 'Академический'), 'улица Кржижановского'),
													((select ID from Regions where name_region = 'Академический'), 'улица Львова'),
													((select ID from Regions where name_region = 'Академический'), 'улица Профсоюзная'),
													((select ID from Regions where name_region = 'Академический'), 'улица Новочерёмушкинская'),
													((select ID from Regions where name_region = 'Академический'), 'Черёмушкинский проезд'),
													((select ID from Regions where name_region = 'Академический'), 'Нахимовский проспект'), 
													((select ID from Regions where name_region = 'Академический'), 'улица Шверника');
												
select * from Streets where name_street = 'улица Львова';


insert into events_streets(ID_Street, old_name, date_naming, date_renaming, reason_name, distance, adjoin_streets, across_street) values ((select ID from Streets where name_street = 'проспект 60-летия Октября'), 	'Профсоюзная улица',		 1958,1977, 'Октябрьская революция',																		   		   2900,	'Черёмушкинская проезд, улица Шверника',																																								'улица Академика Зелинского, улица Вавилова, площадь Гагарина, улица Дмитрия Ульянова'),
																																		 ((select ID from Streets where name_street = 'улица Большая Черёмушкинская'),	'----',						 1955,1963,	'В честь села Черёмушки, через которое проходила',														   2150,	'улица Шверника, 5-ый Загородный проезд',																																								''),
																																		 ((select ID from Streets where name_street = 'улица Вавилова'),		    	'1-ый Академический проезд', 1952,1963, 'C.И.Вавилова',																					   		   4900,	'улица Академика Зелинского, улица Академика Несмеянова, улица Бардина, улица Ляпунова, проспект Ломоносовский, улица Панфёрова, Канатчиковский проезд, улица Кржижановского, Нахимовский проспект',	'проспект 60-летия Октября, улица Губкина, улица Дмитрия Ульянова'),
																														   				 ((select ID from Streets where name_street = 'улица Винокурова'),		    	'3-ий Черёмушкинский проезд',1958,1963, 'А.Н.Винокурова - народного комиссара социального обеспечения и председателя Верховного суда СССР',		   1400,	'----',																																																	'улица Новочерёмушкинская, улица Большая Черёмушкинская'),
																														     	    	 ((select ID from Streets where name_street = 'улица Гримау'),			    	'2-ой Черёмушкинский проезд',1958,1963, 'Х.Гримау-испанского коммуниста',																   		   800,		'улица Шверника, улица Дмитрия Ульянова',																																								'улица Винокурова'),
																													   					 ((select ID from Streets where name_street = 'улица Ферсмана'),				'3-ий Академический проезд', 1952,1963, 'А.Е.Ферсмана - геохимик, минеролог, автор книг Путешествия за камнем',						   		  	   900,		'улица Губкина',																																														'----'),
																																		 ((select ID from Streets where name_street = 'улица Дмитрия Ульянова'),		'1-ый Черёмушкинский проезд',1958,1963, 'Д.И.Ульянова - российского революционера, младшего брата Владимира Ленина',					   		   2900,	'Университетский проспект, Севастопольский проспект',																																					'улица Вавилова, площадь Хо Ши Мина, улица Новочерёмушкинская, улица Большая Черёмушкинская'),
																																		 ((select ID from Streets where name_street = 'улица Губкина'),					'2-ой Академический проезд', 1952,1963, 'И.М.Губкина - организатора советской нефтяной геологии',										   		   640,		'улица Ферсмана',																																														'улица Вавилова, Ленинский проспект'),
																																		 ((select ID from Streets where name_street = 'улица Ивана Бабушкина'),			'2-ая Черёмушкинская улица', 1955,1963, 'И.В.Бабушкина - революционер, большевик-искровец',												   		   1100,	'улица Кедрова',																																														'улица Кржижановского,Нахимовский проспект, улица Дмитрия Ульянова'),
																																 		 ((select ID from Streets where name_street = 'улица Кедрова'),					'3-я Черёмушкинская улица',	 1955,1963, 'М.С.Кедрова - советский политический деятель, чекист',											   		   1180,	'----',																																																	'улица Профсоюзная, улица Новочерёмушкинская, улица Ивана Бабушкина'),
																																 		 ((select ID from Streets where name_street = 'улица Карьер'),					'----',				   	     0,	  1944,	'нахождения по-близости карьера, принадлежавшего Черёмушкинскому кирпичному заводу',			  		   400,		'----',																																																	'4-ый Загородный проезд'),
																																 		 ((select ID from Streets where name_street = 'улица Кржижановского'),			'5-ая Черёмшкинская улица',  1955,1963, 'Г.М.Кржижановского - учёный-энергетик, один из создателей плана ГОЭЛРО, революционер, партийный деятель', 2400,	'улица Львова, Большая Черёмушкинская улица',																																							'улица Профсоюзная, улица Ивана Бабушкина, улица Новочерёмушкинская'),
																																 		 ((select ID from Streets where name_street = 'улица Львова'),					'безымянный переулок', 		 0,   1988, 'Л.М.Львова - полковника милиции, первого начальника Черёмушкинского РУВД', 							   400,		'----',																																																	'улица Кржижановского, улица Кедрова'),
																																 		 ((select ID from Streets where name_street = 'улица Профсоюзная'),				'4-ая Черёмушкинская улица', 1955,1958, '40-летия советских профсоюзов', 																		   9300,	'----',																																																	'улица Дмитрия Ульянова, улица Кедрова, улица Кржижановского, Нахимовский проспект'),
																																		 ((select ID from Streets where name_street = 'улица Новочерёмушкинская'),		'6-ая Черёмушкинская улица', 1958,1963, 'в честь бывшего подмосковного посёлка Новые Черёмушки', 												   3900,	'улица Кедрова',																																														'Нахимовский проспект, улица Дмитрия Ульянова, улица Кржижановского, улица Винокурова, улица Шверника'),
																																 		 ((select ID from Streets where name_street = 'Черёмушкинский проезд'),			'1-ый Черёмушкинский проезд',1958,1985, 'сокращение прошлого названия', 																		   200,		'----',																																																	'проспект 60-летия Октября'),
																																		 ((select ID from Streets where name_street = 'Нахимовский проспект'),			'улица Красикова', 			 1955,1965, 'П.С.Нахимова - адмирал, русский флотоводец, руководитель сражения в Синопской бухте', 					   5100,	'улица Ивана Бабушкина, улица Кржижановского',																																							'улица Вавилова, улица Новочерёмушкинская, улица Профсоюзная'),
																																		 ((select ID from Streets where name_street = 'улица Шверника'),				'улица Телевидения', 		 1958,1971, 'Н.М.Шверника - государственный и партийный деятель, председатель президиума Верховного Совета СССР', 	   1440,	'улица Новочерёмушкинская',																																												'улица Гримау');
				
																					
									
select * 
from events_streets 
where ID = (select ID from Streets where name_street = 'улица Новочерёмушкинская');









