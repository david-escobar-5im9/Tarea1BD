create table correos (
	nombre varchar(50) constraint pk_correos primary key not null,
	dir_correo varchar(50) not null
);
--nomas pa checar que si se haya creado la tabla
select * from correos;


--inercion de prueba
insert into correos(nombre, dir_correo) values
('Wanda Maximoff', 'wanda.maximoff@avengers.org');

--tuve que modificar el varchar de la columna de mails pa que entrara el del profesor x
alter table correos alter column dir_correo type varchar (100);
insert into correos(nombre, dir_correo) values
('Pietro Maximoff', 'pietro@mail.sokovia.ru'),
('Erik Lensherr','fuck_you_charles@brotherhood.of.evil.mutants.space'),
('Charles Xavier','i.am.secretely.filled.with.hubris@xavier-school-4-gifted-youngste'),
('Anthony Edward Stark','iamironman@avengers.gov'),
('Steve Rogers','americas_ass@anti_avengers'),
('The Vision','vis@westview.sword.gov'),
('Clint Barton','bul@lse.ye'),
('Natasja Romanov','blackwidow@kgb.ru'),
('Thor Odinson','god_of_thunder-^_^@royalty.asgard.gov'),
('Logan','wolverine@cyclops_is_a_jerk.com'),
('Ororo Monroe','ororo@weather.co'),
('Scott Summers','o@x'),
('Nathan Summers','cable@xfact.or'),
('Groot','	iamgroot@asgardiansofthegalaxyledbythor.quillsux'),
('Nebula','idonthaveelektras@complex.thanos'),
('Gamora','thefiercestwomaninthegalaxy@thanos.'),
('Rocket Racoon','shhhhhhhh@darknet.ru');

select * from correos;

--query para emails inválidos
select nombre, dir_correo from correos where dir_correo not like '%_@%_.__%';