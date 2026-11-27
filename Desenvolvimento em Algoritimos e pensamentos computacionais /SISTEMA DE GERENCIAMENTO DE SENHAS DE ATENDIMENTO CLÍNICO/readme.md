# Sistema de Gerenciamento de Senhas de Atendimento Clínico

## 🎯 Objetivo

Desenvolver uma aplicação em linguagem C para gerenciar senhas de atendimento de uma clínica médica, organizando os pacientes em filas conforme suas categorias de prioridade.

O sistema realiza o cadastro de pacientes, classifica automaticamente suas prioridades e controla a ordem de atendimento.

## 🔗 Código-fonte

[Ver código final (atendimento.c)](https://github.com/victordanieldev/academico/blob/main/Desenvolvimento%20em%20Algoritimos%20e%20pensamentos%20computacionais%20/SISTEMA%20DE%20GERENCIAMENTO%20DE%20SENHAS%20DE%20ATENDIMENTO%20CL%C3%8DNICO/atendimento.c)

## ⚙️ Funcionalidades

- Cadastro de pacientes.
- Validação das entradas do usuário e tratamento de operações inválidas.
- Classificação automática por prioridade.
- Geração de senhas sequenciais.
- Filas independentes para atendimento normal, preferencial e urgente.
- Consulta da próxima senha.
- Chamada de pacientes.
- Finalização de atendimentos.
- Painel textual com informações das filas.
- Contagem de pacientes aguardando atendimento.

## 💻 Tecnologias utilizadas

- Linguagem C.
- Biblioteca `stdio.h`.
- Biblioteca `stdlib.h`.
- Biblioteca `string.h`.
- Biblioteca `ctype.h`.
- Estruturas (`struct`).
- Funções.
- Filas implementadas com vetores.
- Compilador GCC.

## 📋 Regras de classificação

O sistema trabalha com três categorias de atendimento:

| Categoria | Condição | Exemplo de senha |
|---|---|---|
| Normal | Pacientes sem condições de prioridade | N001 |
| Preferencial | Gestantes, lactantes, pessoas com necessidades especiais, pessoas obesas, mulheres com 60 anos ou mais e homens com 65 anos ou mais | P001 |
| Urgente | Pacientes com idade superior a 80 anos | U001 |

A ordem de atendimento é:

1. Urgente.
2. Preferencial.
3. Normal.

Dentro de cada categoria, é respeitada a ordem de chegada (FIFO).

**Observação:** as regras de classificação são didáticas e não substituem avaliação clínica ou legislação específica.

##  Compilação

É necessário possuir um compilador GCC instalado.

Execute o seguinte comando no terminal:

```bash
gcc atendimento.c -o atendimento
```

## ▶️ Execução

### Linux

```bash
./atendimento
```

### Windows

```bash
atendimento.exe
```

## 🛠️ Funções implementadas

| Função | Responsabilidade |
|---|---|
| `inicializarFila()` | Inicializa as filas |
| `filaVazia()` | Verifica se a fila está vazia |
| `filaCheia()` | Verifica a capacidade da fila |
| `inserirPaciente()` | Insere pacientes na fila |
| `removerPaciente()` | Remove o próximo paciente da fila |
| `quantidadeFila()` | Conta pacientes em espera |
| `obterFila()` | Retorna a fila de acordo com a categoria |
| `classificarPaciente()` | Define a prioridade |
| `gerarSenha()` | Gera senha sequencial |
| `nomeCategoria()` | Retorna o nome da categoria em texto |
| `lerTexto()` | Lê e valida texto não vazio |
| `lerInteiro()` | Lê e valida números dentro de um intervalo |
| `lerGenero()` | Lê e valida o gênero (F/M) |
| `cadastrarPaciente()` | Registra pacientes |
| `consultarProxima()` | Consulta a próxima senha |
| `chamarPaciente()` | Realiza a chamada |
| `finalizarAtendimento()` | Finaliza atendimentos |
| `exibirPainel()` | Exibe informações das filas |
| `menu()` | Controla as opções do sistema |
| `main()` | Inicializa as filas e executa o menu |

## 📝 Exemplo de utilização

### Cadastro de paciente

```text
--- CADASTRO DE PACIENTE ---
Nome: Maria
Genero (F/M): F
Idade: 35
Gestante (1-sim, 0-nao): 1
Lactante (1-sim, 0-nao): 0
Necessidade especial (1-sim, 0-nao): 0
Obesidade (1-sim, 0-nao): 0

Paciente cadastrado com sucesso!
Senha gerada: P001 (PREFERENCIAL)
```

### Exemplo de chamada

```text
================================
 CHAMADA DE PACIENTE
================================
Nome: Maria
Senha: P001
Categoria: PREFERENCIAL
================================
```

### Exemplo de painel

```text
================================
 PAINEL DE ATENDIMENTO
================================
Senha chamada: P001
Categoria: PREFERENCIAL
--------------------------------
Proximas senhas: nenhuma
--------------------------------
Em espera - Urgente: 0
Em espera - Preferencial: 0
Em espera - Normal: 0
================================
```

## 📂 Estrutura do projeto

```text
sistema-atendimento-clinico/
│
├── atendimento.c
└── README.md
```

## 👨‍💻 Autor : Victor Daniel

Projeto acadêmico desenvolvido para avaliação da disciplina de Programação em Linguagem C.

---

Desenvolvido em linguagem C.
