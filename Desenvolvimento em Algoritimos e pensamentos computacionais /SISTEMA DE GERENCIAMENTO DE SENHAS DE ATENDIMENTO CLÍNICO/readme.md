Sistema de Gerenciamento de Senhas de Atendimento Clínico
Objetivo
Desenvolver uma aplicação em linguagem C para gerenciar senhas de atendimento de uma clínica médica, organizando os pacientes em filas conforme suas categorias de prioridade.

Funcionalidades
Cadastro de pacientes.
Classificação automática por prioridade.
Geração de senhas sequenciais.
Filas independentes para atendimento normal, preferencial e urgente.
Consulta da próxima senha.
Chamada de pacientes.
Finalização de atendimentos.
Painel textual com informações das filas.
Contagem de pacientes aguardando atendimento.
Tecnologias utilizadas
Linguagem C.
Biblioteca stdio.h.
Biblioteca stdlib.h.
Biblioteca string.h.
Estruturas (struct).
Funções.
Filas implementadas com vetores.
Compilação
É necessário possuir um compilador GCC instalado.

Execute no terminal:


bash
gcc main.c -o atendimento
Execução
No Linux:


bash
./atendimento
No Windows:


bash
atendimento.exe
Funções implementadas

Função	Responsabilidade
inicializarFila()	Inicializa as filas
filaVazia()	Verifica se a fila está vazia
filaCheia()	Verifica capacidade da fila
inserirFila()	Insere pacientes
removerFila()	Remove o próximo paciente
classificarPaciente()	Define a prioridade
gerarSenha()	Gera senha sequencial
cadastrarPaciente()	Registra pacientes
consultarProxima()	Consulta a próxima senha
chamarPaciente()	Realiza a chamada
finalizarAtendimento()	Finaliza atendimento
quantidadeFila()	Conta pacientes em espera
exibirPainel()	Exibe informações das filas
menu()	Controla as opções do sistema
main()	Inicializa e executa o programa
Exemplo de utilização
Cadastro de um paciente:


text
Nome: Maria
Genero: F
Idade: 35
Gestante: 1
Lactante: 0
Necessidade especial: 0
Obesidade: 0

Paciente cadastrado com sucesso!
Senha gerada: P001
Exemplo de chamada:


text
================================
       CHAMADA DE PACIENTE
================================
Nome: Maria
Senha: P001
Categoria: PREFERENCIAL
================================
Autor
Projeto acadêmico desenvolvido para avaliação da disciplina de Programação em Linguagem C.
