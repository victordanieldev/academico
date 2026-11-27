
# Sistema de Gerenciamento de Senhas de Atendimento Clínico

## 🎯 Objetivo

Desenvolver uma aplicação em linguagem C para gerenciar senhas de atendimento de uma clínica médica, organizando os pacientes em filas conforme suas categorias de prioridade.

O sistema realiza o cadastro de pacientes, classifica automaticamente suas prioridades e controla a ordem de atendimento.

## ⚙️ Funcionalidades

- Cadastro de pacientes.
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

## 🚀 Compilação

É necessário possuir um compilador GCC instalado.

Execute o seguinte comando no terminal:

```bash
gcc main.c -o atendimento
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
| `inserirFila()` | Insere pacientes |
| `removerFila()` | Remove o próximo paciente |
| `classificarPaciente()` | Define a prioridade |
| `gerarSenha()` | Gera senha sequencial |
| `cadastrarPaciente()` | Registra pacientes |
| `consultarProxima()` | Consulta a próxima senha |
| `chamarPaciente()` | Realiza a chamada |
| `finalizarAtendimento()` | Finaliza atendimentos |
| `quantidadeFila()` | Conta pacientes em espera |
| `exibirPainel()` | Exibe informações das filas |
| `menu()` | Controla as opções do sistema |
| `main()` | Inicializa e executa o programa |

## 📝 Exemplo de utilização

### Cadastro de paciente

```text
Nome: Maria
Genero: F
Idade: 35
Gestante: 1
Lactante: 0
Necessidade especial: 0
Obesidade: 0

Paciente cadastrado com sucesso!
Senha gerada: P001
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

## 📂 Estrutura do projeto

```text
sistema-atendimento-clinico/
│
├── main.c
├── README.md
└── .gitignore
```

## 👨‍💻 Autor

Projeto acadêmico desenvolvido para avaliação da disciplina de Programação em Linguagem C.

---

Desenvolvido em linguagem C.
