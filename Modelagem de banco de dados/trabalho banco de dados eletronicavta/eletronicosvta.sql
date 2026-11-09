-- criaçao database

create database db_eletronicosvta;

use db_eletronicosvta;


-- criaçao das tabales

create table pedido(
    id_pedido int primary key not null,
    data_pedido date,
    situacao varchar(100)
);

create table produto(
    cod_produto int primary key not null ,
    nome varchar(100),
    categoria varchar(100),
    preco decimal(10,2),
    estoque int
);

create table funcionario(
    cod_func int primary key not null,
    nome varchar(100),
    demissao date,
    cargo varchar(100),
    salario decimal (10,2)
);

create table cliente(
    cod_cliente int primary key not null,
    nome varchar(100),
    email varchar(100),
    cidade varchar(100),
    fone varchar(20)
);

create table pagamento(
    id_pag int primary key not null,
    valor decimal (10,2),
    forma varchar(100),
    data_pagamento date,
    situacao varchar(100)

);

create table item_pedido(
    id_item int primary key not null, 
    quantidade int,
    preco_unitario decimal(10,2)

);

/* foreign key pedido */

alter table pedido add column cod_func int;
alter table pedido add column cod_cliente int;
alter table pedido add foreign key (cod_func) references funcionario(cod_func);
alter table pedido add foreign key (cod_cliente) references cliente(cod_cliente);

/* foreign key pagamento */

alter table pagamento add column id_pedido int;
alter table pagamento add foreign key (id_pedido) references pedido(id_pedido);

/* foreign key item_pedido */

alter table item_pedido add column id_pedido int;
alter table item_pedido add column cod_produto int;
alter table item_pedido add foreign key (id_pedido) references pedido(id_pedido);
alter table item_pedido add foreign key (cod_produto) references produto(cod_produto);

-- cliente 

insert into cliente(cod_cliente, nome, email, fone, cidade)values
(1,'Ana Julia', 'ana.souza@email.com',      '61991110001', 'Brasília' ),
(2, 'Bruno Lima',     'bruno.lima@email.com',     '61991110002', 'Taguatinga'),
(3, 'Carla Mendes',   'carla.mendes@email.com',   '61991110003', 'Ceilândia' ),
(4, 'Diego Rocha',    'diego.rocha@email.com',    '61991110004', 'Gama' ),
(5, 'Elisa Ferreira', 'elisa.ferreira@email.com', '61991110005', 'Sobradinho' );

/* funcionario */ 

insert into funcionario(cod_func, nome, cargo, salario, demissao) values
(1, 'Marcos Oliveira', 'Vendedor',   2500.00, '2023-03-15'),
(2, 'Patrícia Alves',  'Vendedora',  2600.00, '2022-08-01'),
(3, 'Rafael Costa',    'Gerente',    5500.00, '2020-01-10'),
(4, 'Juliana Martins', 'Atendente',  2100.00, '2024-02-20');


-- produto 

insert into produto(cod_produto, nome, categoria, preco, estoque) values
(1, 'Notebook 15"',       'Informática', 3500.00, 15),
(2, 'Mouse sem fio',      'Periféricos',   80.00, 50),
(3, 'Teclado mecânico',   'Periféricos',  250.00, 30),
(4, 'Monitor 24"',        'Monitores',    900.00, 20),
(5, 'Headset gamer',      'Áudio',        180.00, 25),
(6, 'Webcam HD',          'Periféricos',  150.00, 40);




-- pedido 

insert into pedido(id_pedido, cod_cliente, cod_func, data_pedido, situacao) values 
(1, 1, 1, '2026-10-01', 'Entregue'),
(2, 2, 2, '2026-10-05', 'Entregue'),
(3, 3, 1, '2026-10-12', 'Enviado'),
(4, 4, 3, '2026-10-20', 'Pendente'),
(5, 5, 4, '2026-11-02', 'Cancelado');

-- item_pedido 

insert into item_pedido(id_item, id_pedido, cod_produto, quantidade, preco_unitario) values 
(1, 1, 1, 1, 3500.00),
(2, 1, 2, 2,   80.00),
(3, 2, 4, 2,  900.00),
(4, 2, 3, 1,  250.00),
(5, 3, 5, 1,  180.00),
(6, 3, 6, 1,  150.00),
(7, 4, 1, 1, 3500.00),
(8, 4, 2, 1,   80.00),
(9, 5, 4, 1,  900.00);

-- pagamento 

insert into pagamento(id_pag, id_pedido, forma, valor, data_pagamento, situacao) values 
(1, 1, 'Cartão de crédito', 3660.00, '2026-10-01', 'Aprovado'),
(2, 2, 'Pix',               2050.00, '2026-10-05', 'Aprovado'),
(3, 3, 'Boleto',             330.00, '2026-10-13', 'Aprovado'),
(4, 4, 'Cartão de crédito', 3580.00, '2026-10-20', 'Pendente'),
(5, 5, 'Pix',                900.00, '2026-11-02', 'Estornado');

-- consultas basicas 

-- Todos os clientes
select * 
from cliente;

-- Apenas nome e cidade dos clientes
select nome, cidade 
from cliente;

-- Nome e preço dos produtos
select nome, preco 
from produto;

-- Todos os funcionários
select * 
from funcionario;

-- Todos os pedidos
select * 
from pedido;


/* intermediarias */


-- Cidades diferentes onde há clientes
select distinct cidade 
from cliente;

-- Categorias de produtos sem repetição
select distinct categoria 
from produto;


-- Valor total de cada item 
select id_item, id_pedido, quantidade, preco_unitario,  quantidade * preco_unitario as subtotal
from item_pedido;

-- Preço do produto com 10% de aumento
select nome, preco, preco * 1.10 as preco_reajustado
from produto;

-- Preço com desconto de R$ 20,00
select nome, preco, preco - 20 as preco_promocional
from produto;

-- Salário anual e quinzena 
select nome, salario, salario * 12 as salario_anual, salario / 2 as quinzena
from funcionario;

-- Valor total do estoque de cada produto
select nome, estoque, preco, estoque * preco as valor_em_estoque
from produto;

-- Preço + frete fixo de R$ 15,00
select nome, preco, preco + 15 as preco_com_frete
from produto;

-- Maior que
select * 
from produto 
where preco > 200;

-- Menor que
select * 
from produto 
where estoque < 25;

-- Maior ou igual
select * 
from funcionario 
where salario >= 2600;

-- Menor ou igual
select * 
from produto 
where preco <= 150;

-- Igual
select * 
from pedido 
where situacao = 'Entregue';

-- Diferente
select * 
from pedido 
where situacao <> 'Cancelado';

-- Funcionários que ainda trabalham 
select * 
from funcionario 
where demissao is null;


select * 
from produto
where categoria = 'Periféricos' and preco < 200;

--  pedidos pendentes ou cancelados
select * 
from pedido
where situacao = 'Pendente' or situacao = 'Cancelado';

--  produtos que NÃO são da categoria Periféricos
select * 
from produto
where not categoria = 'Periféricos';

--  vendedores(a) com salário acima de 2500
select * 
from funcionario
where (cargo = 'Vendedor' or cargo = 'Vendedora') and salario > 2500;


select sum(valor) as total_recebido
from pagamento
where situacao = 'Aprovado';

--  preço médio dos produtos
select avg(preco) as preco_medio 
from produto;

--  produto mais caro
select max(preco) as maior_preco 
from produto;

--  menor salário
select min(salario) as menor_salario 
from funcionario;

--  quantidade de clientes
select count(*) as total_clientes 
from cliente;

--  quantidade de pedidos entregues
select count(*) as pedidos_entregues
from pedido
where situacao = 'Entregue';

-- Várias agregações juntas
select count(*) as qtd_produtos,
       min(preco) as menor_preco,
       max(preco) as maior_preco,
       avg(preco) as preco_medio,
       sum(estoque) as estoque_total
from produto;


-- Nomes de clientes que começam com 'A'
select *
from cliente 
where nome like 'A%';

-- E-mails que terminam com '@email.com'
select nome, email 
from cliente 
where email like '%@email.com';

-- Produtos que contêm a palavra 'gamer' ou 'mecânico'
select * 
from produto
where nome like '%gamer%' or nome like '%mecânico%';

-- Nomes com 'a' na segunda posição
select * 
from cliente 
where nome like '_a%';


-- Produtos com preço entre 100 e 300
select * 
from produto 
where preco between 100 and 300;

-- Pedidos feitos em outubro de 2026
select * 
from pedido
where data_pedido between '2026-10-01' and '2026-10-31';

-- Funcionários com salário entre 2000 e 3000
select nome, salario 
from funcionario 
where salario between 2000 and 3000;


-- Clientes de determinadas cidades
select * 
from cliente
where cidade in ('Brasília', 'Gama', 'Ceilândia');

-- Pedidos com situação Entregue ou Enviado
select * 
from pedido 
where situacao in ('Entregue', 'Enviado');

-- produtos que não são de Áudio nem Monitores
select * 
from produto 
where categoria not in ('Áudio', 'Monitores');

-- Produtos do mais barato ao mais caro
select nome, preco 
from produto 
order by preco asc;

-- Funcionários do maior para o menor salário
select nome, cargo, salario 
from funcionario 
order by salario desc;

-- Clientes em ordem alfabética
select * 
from cliente 
order by nome;

-- Ordenação por duas colunas: categoria (A-Z) e preço (maior primeiro)
select categoria, nome, preco
from produto
order by categoria asc, preco desc;


-- Quantidade de produtos por categoria
select categoria, count(*) as qtd_produtos
from produto
group by categoria;

-- Preço médio por categoria
select categoria, avg(preco) as preco_medio
from produto
group by categoria;

-- Quantidade de pedidos por situação
select situacao, count(*) as qtd_pedidos
from pedido
group by situacao;

-- Total pago por forma de pagamento
select forma, sum(valor) as total
from pagamento
group by forma;

-- Quantidade de clientes por cidade
select cidade, count(*) as qtd_clientes
from cliente
group by cidade;

-- Categorias com mais de 1 produto
select categoria, count(*) as qtd_produtos
from produto
group by categoria
having count(*) > 1;

-- Formas de pagamento com total acima de 1000
select forma, sum(valor) as total
from pagamento
group by forma
having sum(valor) > 1000;

-- Pedidos cujo valor total (soma dos itens) é maior que 1000
select id_pedido, sum(quantidade * preco_unitario) as total_pedido
from item_pedido
group by id_pedido
having sum(quantidade * preco_unitario) > 1000
order by total_pedido desc;


-- Produtos com preço acima da média
select nome, preco
from produto
where preco > (select avg(preco) from produto);

-- Funcionário com o maior salário
select nome, salario
from funcionario
where salario = (select max(salario) from funcionario);

-- Clientes que já fizeram pelo menos um pedido
select nome
from cliente
where cod_cliente in (select cod_cliente from pedido);

-- Clientes que nunca fizeram pedido
select nome
from cliente
where cod_cliente not in (select cod_cliente from pedido);

-- Produtos que já foram vendidos em algum pedido
select nome
from produto
where cod_produto in (select cod_produto from item_pedido);

-- Produtos que nunca foram vendidos
select nome
from produto
where cod_produto not in (select cod_produto from item_pedido);

-- Pedidos com pagamento aprovado 
select * from pedido p
where exists (select 1 from pagamento pg where pg.id_pedido = p.id_pedido and pg.situacao = 'Aprovado');
              


 -- pedido com nome do cliente
select p.id_pedido, c.nome as cliente, p.data_pedido, p.situacao
from pedido p
inner join cliente c on p.cod_cliente = c.cod_cliente;

-- Pedido com cliente e funcionário responsável
select p.id_pedido, c.nome as cliente, f.nome as funcionario, p.data_pedido
from pedido p
join cliente c     on p.cod_cliente = c.cod_cliente
join funcionario f on p.cod_func = f.cod_func;

-- Itens de cada pedido com nome do produto e subtotal
select ip.id_pedido, pr.nome as produto, ip.quantidade, ip.preco_unitario, ip.quantidade * ip.preco_unitario as subtotal
from item_pedido ip
join produto pr on ip.cod_produto = pr.cod_produto
order by ip.id_pedido;

-- Pedido completo (cliente + produto + pagamento)
select p.id_pedido, c.nome as cliente, pr.nome as produto, ip.quantidade, pg.forma, pg.situacao as situacao_pagamento
from pedido p
join cliente c      on p.cod_cliente = c.cod_cliente
join item_pedido ip on p.id_pedido = ip.id_pedido
join produto pr     on ip.cod_produto = pr.cod_produto
join pagamento pg   on p.id_pedido = pg.id_pedido;

--  todos os clientes, mesmo os sem pedidos
select c.nome, p.id_pedido
from cliente c
left join pedido p on c.cod_cliente = p.cod_cliente;

--  produtos que nunca foram vendidos
select pr.nome
from produto pr
left join item_pedido ip on pr.cod_produto = ip.cod_produto
where ip.id_item is null;

--  todos os funcionários, mesmo sem vendas
select p.id_pedido, f.nome as funcionario
from pedido p
right join funcionario f on p.cod_func = f.cod_func;

-- : total gasto por cliente
select c.nome, sum(ip.quantidade * ip.preco_unitario) as total_gasto
from cliente c
join pedido p       on c.cod_cliente = p.cod_cliente
join item_pedido ip on p.id_pedido = ip.id_pedido
group by c.nome
order by total_gasto desc;

--  quantidade de pedidos por funcionário
select f.nome, count(p.id_pedido) as qtd_pedidos
from funcionario f
left join pedido p on f.cod_func = p.cod_func
group by f.nome;

-- Lista única com nomes de clientes e funcionários
select nome, 'Cliente' as tipo 
from cliente
union
select nome, 'Funcionário' as tipo 
from funcionario;

-- Produtos baratos  ou caros  em uma única lista
select nome, preco, 'Barato' as faixa 
from produto 
where preco < 100
union
select nome, preco, 'Caro'   as faixa 
from produto 
where preco > 1000;

--  cidades dos clientes + clientes de Brasília
select cidade 
from cliente
union all
select cidade from cliente where cidade = 'Brasília';



delimiter $$

create procedure sp_total_pedido(in p_id_pedido int, out p_total decimal(10,2))
begin
    select sum(quantidade * preco_unitario)
    into p_total
    from item_pedido
    where id_pedido = p_id_pedido;
end;

delimiter ;




delimiter $$

create procedure sp_pedidos_cliente(in p_cod_cliente int)
begin
    select p.id_pedido, p.data_pedido, p.situacao,
           sum(ip.quantidade * ip.preco_unitario) as total
    from pedido p
	join item_pedido ip on p.id_pedido = ip.id_pedido
    where p.cod_cliente = p_cod_cliente
    group by p.id_pedido, p.data_pedido, p.situacao;
end;

delimiter ;




delimiter $$

create procedure sp_registrar_pagamento(
    in p_id_pag int,
    in p_id_pedido int,
    in p_forma varchar(100)
)
begin
    declare v_total decimal(10,2);

    select sum(quantidade * preco_unitario)
    into v_total
    from item_pedido
    where id_pedido = p_id_pedido;

    insert into pagamento (id_pag, id_pedido, forma, valor, data_pagamento, situacao)
    values (p_id_pag, p_id_pedido, p_forma, v_total, curdate(), 'Aprovado');
end;

delimiter ;



delimiter $$

create procedure sp_reajuste_salario(in p_cargo varchar(100), in p_percentual decimal(5,2))
begin
    update funcionario
    set salario = salario * (1 + p_percentual / 100)
    where cargo = p_cargo;
end;

delimiter ;












