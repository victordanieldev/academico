create database db_formula1;

use db_formula1;

create table tb_equipe(
    sigla int not null primary key,
    nome varchar(100)


);

create table tb_pilotos(
    numero int not null primary key,
    nome varchar(100)

);




create table tb_participantes(
    sigla_grupo int not null primary KEY,
    pontuaçao_lincenciada int not null
);


create table tb_paises(
    codigo int not null primary key,
    nome varchar (100)  not null 

);


create table tb_corrida(
    codigo_corrida int not null primary key,
    nome_gp varchar(100) not null,
    data_real date not null,
    qtd_voltas int not null

);

/* paises */
insert into tb_paises (codigo , nome)
VALUES
(1, 'Brasil'),
(2, 'França'),
(3, 'Espanha'),
(4, 'Italia'),
(5, 'EUA');


select *
from tb_paises;

/* fim */

/* pilotos */
alter table tb_pilotos add column codigoPais int;
alter table tb_pilotos add foreign key (codigoPais) references tb_paises(codigo);

alter table tb_pilotos add column siglaEquipe int;
alter table tb_pilotos add foreign key (siglaEquipe)  references tb_equipe(sigla) ;

insert into tb_pilotos (numero, nome , codigoPais)
values
(1, 'Ayrton Senna', 1),
(2, ' Nelson Piquet', 1),
(3, ' Emerson Fittipaldi', 1),
(4, ' Rubens Barrichello', 1),
(5, ' Felipe Massa', 1),
(6, ' Alberto Ascari', 4),
(7, ' Nino Farina', 4),
(8, ' Jarno Trulli', 4),
(9, ' Alain Prost', 2),
(10, ' Jean Alesi', 2),
(11, ' Mario Andretti', 5),
(12, ' Phil Hill', 5),
(13, ' Dan Gurney', 5),
(14, ' Alexander Rossi', 5),
(15, ' Fernando Alonso', 3),
(16, ' Pedro de la Rosa', 3);


select *
from tb_pilotos;

/* fim pilotos */

/* equipes */

alter table tb_equipe add column codigo_pais int;
alter table tb_equipe add foreign key (codigo_pais) references tb_paises(codigo);


insert into tb_equipe (sigla , nome, codigo_pais)
values
(1,'Ferrari', 4),
(2,'McLaren', null),
(3,'Mercedes', null),
(4,'Red Bull Racing', null),
(5,'Williams', null),
(6,'Aston Martin', null),
(7,'Alpine', null),
(8,'Haas', 5),
(9,'Racing Bulls', null),
(10,'Audi', null);


select *
from tb_equipe;

/* fim equipe */

/* participantes */

alter table tb_participantes add column num_piloto int;
alter table tb_participantes add foreign key (num_piloto) references tb_pilotos(numero);

insert into tb_participantes (sigla_grupo, num_piloto, pontuaçao_lincenciada)
values
(1,1,20),
(2,2,20),
(3,3,23),
(4,4,26),
(5,5,22),
(6,6,25),
(7,7,23),
(8,8,18),
(9,9,10),
(10,10,28),
(11,11,30),
(12,12,20),
(13,13,24),
(14,14,10),
(15,15,22),
(16,16,28);

select *
from tb_participantes;

/* fim participantes */

/* corridas */

insert into tb_corrida (codigo_corrida, nome_gp, data_real, qtd_voltas)
values
(1, 'GP da Austrália', '2025-03-16', 58),
(2, 'GP da China', '2025-03-23', 56),
(3, 'GP do Japão', '2025-04-06', 53),
(4, 'GP do Bahrein', '2025-04-13', 57),
(5, 'GP da Arábia Saudita', '2025-04-20', 50),
(6, 'GP de Miami', '2025-05-04', 57),
(7, 'GP da Emília-Romanha', '2025-05-18', 63),
(8, 'GP de Mônaco', '2025-05-25', 78),
(9, 'GP da Espanha', '2025-06-01', 66),
(10, 'GP do Canadá', '2025-06-15', 70);

select *
from tb_corrida;

/* fim corridas */

/* nome dos paises que começa com a letra B e terminam com a letra L */

select nome 
from tb_paises
where nome like 'B%l';

/* Liste o nome dos pilotos que são dos países BRASIL, ITÁLIA e FRANÇA */

select tb_pilotos.nome, tb_paises.nome
from tb_pilotos
join tb_paises
on tb_pilotos.codigoPais = tb_paises.codigo
where tb_paises.nome in('Brasil', 'Italia' , 'França');

/* Liste o nome dos pilotos. */

select nome 
from tb_pilotos;

/* Liste o nome dos gp e a quantidade de voltas (use ALIAS) */

select nome_gp as 'Nome do grupo' , qtd_voltas AS 'Quantidades de voltas'
from tb_corrida;

/* Liste o nome dos pilotos e seus países */

select tb_pilotos.nome AS 'Nome do piloto ', tb_paises.nome AS 'Pais'
from tb_pilotos
join tb_paises
on tb_pilotos.codigoPais = tb_paises.codigo;

/* Insira o atributo salário na tabela piloto */

alter table tb_pilotos add column salario decimal(10.2);

/* Popule o atributo salário da tabela piloto. */

update tb_pilotos
set salario = 85000.00
where numero = 1;

update tb_pilotos
set salario = 90000.00
where numero = 2;

update tb_pilotos
set salario = 85000.00
where numero = 3;

update tb_pilotos
set salario = 95000.00
where numero = 4;

update tb_pilotos
set salario = 90000.00
where numero = 5;

update tb_pilotos
set salario = 75000.00
where numero = 6;

update tb_pilotos
set salario = 92000.00
where numero = 7;

update tb_pilotos
set salario = 78000.00
where numero = 8;

update tb_pilotos
set salario = 100000.00
where numero = 9;

update tb_pilotos
set salario = 97000.00
where numero = 10;

update tb_pilotos
set salario = 89000.00
where numero = 11;

update tb_pilotos
set salario = 82000.00
where numero = 12;

update tb_pilotos
set salario = 76000.00
where numero = 13;

update tb_pilotos
set salario = 70000.00
where numero = 14;

update tb_pilotos
set salario = 98000.00
where numero = 15;

update tb_pilotos
set salario = 87000.00
where numero = 16;


select numero, nome , salario 
from tb_pilotos;


/* Liste o nome dos pilotos cujos salários sejam entre 70 e 100 mil. */

select nome 
from tb_pilotos
where salario BETWEEN 70000 and 100000;

/* Retorne para cada cod_pais, a média salarial dos empregados */

select codigoPais, avg(salario) AS 'Media Salarial'
from tb_pilotos
group by codigoPais;

/* Exiba todos os diferentes valores dos salários contidos na tabela pilotos ordenados em ordem
crescente de valor */

select distinct salario
from tb_pilotos
order by salario ASC;








