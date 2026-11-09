## MODELAGEM CONCEITUAL

1.1 Descrição do cenário (Mini-Mundo)

Uma loja eletronica precisa de um sistema para organizar suas atividades e facilitar o 
controle das informações do dia a dia. Esse sistema será utilizado para registrar 
clientes, funcionários, produtos do cardápio, pedidos, itens dos pedidos e pagamentos.
Os clientes terão um cadastro para que o restaurante consiga identificá-los e 
acompanhar os pedidos realizados. Os funcionários também serão cadastrados, 
permitindo identificar quem ficou responsável por registrar cada pedido.
O restaurante terá produtos disponíveis no cardápio, como bebidas, pratos principais, 
sobremesas e entradas. Cada produto terá um código de identificação e um nome.
Os clientes poderão realizar pedidos contendo um ou mais produtos. Cada pedido terá 
um código de identificação e uma data de realização. Um cliente poderá realizar vários 
pedidos, mas cada pedido estará relacionado a apenas um cliente.
Como um pedido pode conter diferentes produtos, será necessário registrar os itens 
que fazem parte dele. Para isso, será utilizada a entidade ITEM_PEDIDO, que permitirá 
identificar cada item e registrar sua quantidade.
Os funcionários serão responsáveis por registrar os pedidos. Um funcionário poderá 
registrar vários pedidos, mas cada pedido será registrado por apenas um funcionário.
O sistema também deverá registrar os pagamentos realizados. Cada pagamento terá 
um código de identificação e um valor. Cada pedido terá um pagamento relacionado a 
ele.
Com essas informações, o restaurante poderá organizar os registros de clientes, 
funcionários, produtos, pedidos e pagamentos, facilitando o acompanhamento das 
atividades.

1.2 Modelo Entidade-Relacionamento (MER)

A partir do cenário descrito, foram identificadas seis entidades para representar as 
principais informações do restaurante. Cada entidade possui uma chave primária para 
sua identificação e um atributo adicional. Entidades e atributos

CLIENTE
<li>  id_cliente (chave primária)
<li>nome</li>

FUNCIONÁRIO
<li> id_funcionario (chave primária)</li>
<li> nome</li>
PRODUTO
<li> id_produto (chave primária)</li>
<li>nome</li>

PEDIDO
<li>id_pedido (chave primária)</li>
<li> data</li>

ITEM_PEDIDO
<li> id_item (chave primária)</li>
<li> quantidade</li>

PAGAMENTO
<li> id_pagamento (chave primária)</li>
<li> valor</li>

Relacionamentos e cardinalidades

1. CLIENTE — REALIZA — PEDIDO (1:N)
Um cliente pode realizar vários pedidos, mas cada pedido pertence a apenas um 
cliente.
Cliente: (0,n) | Pedido: (1,1)

2. FUNCIONÁRIO — REGISTRA — PEDIDO (1:N) Um funcionário pode registrar vários pedidos, mas cada pedido é registrado por apenas 
um funcionário.
Funcionário: (0,n) | Pedido: (1,1)

3. PEDIDO — CONTÉM — ITEM_PEDIDO (1:N)
Um pedido pode conter vários itens, mas cada item pertence a apenas um pedido.
Pedido: (1,n) | Item_Pedido: (1,1)

4. PRODUTO — APARECE EM — ITEM_PEDIDO (1:N)
Um produto pode aparecer em vários itens de pedidos diferentes, mas cada item 
corresponde a apenas um produto.
Produto: (0,n) | Item_Pedido: (1,1)

5. PEDIDO — POSSUI — PAGAMENTO (1:1)
Cada pedido possui um pagamento registrado, e cada pagamento está relacionado a 
apenas um pedido.
Pedido: (1,1) | Pagamento: (1,1)

Diagrama MER
O diagrama conceitual foi elaborado no BrModelo, representando as seis entidades, 
seus atributos, as chaves primárias, os relacionamentos e as cardinalidades definidos 
nesta etapa.
