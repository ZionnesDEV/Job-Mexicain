INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_mexicain','mexicain',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_mexicain','mexicain',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_mexicain', 'mexicain', 1)
;

INSERT INTO `jobs` (`name`, `label`) VALUES
('mexicain', 'mexicain');


INSERT INTO `job_grades` (id, job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('90', 'mexicain',0,'recrue','Recrue',12,'{}','{}'),
	('91', 'mexicain',1,'novice','Novice',24,'{}','{}'),
	('92', 'mexicain',2,'experimente','Experimente',36,'{}','{}'),
	('93', 'mexicain',3,'chief',"Chef d\'Ã©quipe",48,'{}','{}'),
	('94', 'mexicain',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `weight`) VALUES
        ('petitefrite', 'Petite Frite', -1),
        ('moyennefrite', 'Moyenne Frite', -1),
        ('grandefrite', 'Grande Frite', -1),
	('gobeletvide', 'Gobelet vide', -1),
        ('gobeletdecoca', 'Gobelelet de coca', -1),
        ('gobeletdebupu', 'Gobelelet de Bupu', -1),
        ('gobeletdeicetea', 'Gobelelet de icetea', -1),
        ('gobeletdebiere', 'Gobelelet de bière', -1),
        ('gobeletdebupu', 'Gobelet de Bupu', '-1'),
        ('patate', 'Patate', '-1'),
        ('patatecoupee', 'Patate Coupï¿½e', '-1'),
        ('fajitas', 'Fajitas', '-1', '0', '1'),
        ('viande', 'Viande', '-1', '0', '1'),
        ('avocat', 'Avocat', '-1', '0', '1'),
        ('sprite', 'Gobelet de sprite', -1),
        ('biere', 'Gobelet de biï¿½re', '-1'),
        ('guacamole', 'Guacamole', '-1', '0', '1');