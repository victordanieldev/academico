#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

#define MAX 500
#define PROXIMAS 5

#define NORMAL 1
#define PREFERENCIAL 2
#define URGENTE 3

typedef struct{
    char nome[100];
    char genero;
    int idade;
    int gestante;
    int lactante;
    int necessidadeEspecial;
    int obeso;
    char senha[10];
    int categoria;
}Paciente;

typedef struct{
    Paciente dados [MAX];
    int inicio;
    int fim;
    
}Fila;     

Fila normal, preferencial, urgente;
Paciente emAtendimento;
int atendimentoAtivo = 0;

int contadorN = 0;
int contadorP = 0;
int contadorU = 0;


// prototipos 
void inicializarFila(Fila * f);
int filaVazia(Fila * f);
int filaCheia(Fila * f);
int inserirPaciente(Fila * f, Paciente paciente);
Paciente removerPaciente(Fila * f);
int quantidadeFila(Fila * f);
Fila *obterFila(int categoria);
int classificarPaciente(Paciente p);
void gerarSenha(Paciente *p);
const char *nomeCategoria(int categoria);
void lerTexto(const char *msg, char destino[], int tamanho);
int lerInteiro(const char *msg, int minimo, int maximo);
char lerGenero(void);
void cadastrarPaciente(void);
void consultarProxima(void);
void chamarPaciente(void);
void finalizarAtendimento(void);
void exibirPainel(void);
void menu(void);

// iniciar filar
void inicializarFila(Fila * f){
    f->inicio = 0;
    f->fim = 0;
}

// verificar se a fila esta vazia

int filaVazia(Fila * f){
    return f->inicio == f->fim;
}

// verificar se a fila esta cheia

int filaCheia(Fila * f){
    return f->fim == MAX;
}

// Inserir paciente na fila

int inserirPaciente(Fila * f ,Paciente  paciente){
    if(filaCheia(f)){
        return 0 ;

    }

    f-> dados[f->fim] = paciente;
    f->fim++;

    return 1;
}


// remover paciente da fila

Paciente removerPaciente(Fila * f){
    Paciente paciente = f-> dados[f->inicio];
    f->inicio++;

    if(f->inicio == f->fim){
        f->inicio = 0;
        f->fim = 0;
    }

    return paciente;
}

int quantidadeFila(Fila * f){
    return f-> fim - f->inicio;
}
Fila *obterFila(int categoria){
    if(categoria == URGENTE)return &urgente;
    if(categoria == PREFERENCIAL) return &preferencial;
    return &normal;
}

// classificar paciente

int classificarPaciente(Paciente p){

    if(p.idade > 80){
        return URGENTE;
    }
    if(p.gestante || p.lactante || p.necessidadeEspecial || p.obeso || (p.genero == 'F' && p.idade >= 60) || (p.genero == 'M' && p.idade >= 60)  ){
        return PREFERENCIAL;
    } 
    return NORMAL;
}

// gerar senha

void gerarSenha(Paciente *p){
    if(p-> categoria == URGENTE){
        contadorU++;
        sprintf(p->senha, "U%03d", contadorU);
    }else if(p-> categoria == PREFERENCIAL){
        contadorP++;
        sprintf(p->senha,"P%03d", contadorP);
    }else{
        contadorN++;
        sprintf(p->senha, "N%03d", contadorN);

    }
   
}

const char *nomeCategoria(int categoria){
    if(categoria == URGENTE) return "URGENTE";
    if(categoria == PREFERENCIAL) return "PREFERENCIAL";
    return "NORMAL";
}

void lerTexto(const char *msg, char destino[], int tamanho) {
    do {
        printf("%s", msg);
        if (fgets(destino, tamanho, stdin) == NULL) {
            destino[0] = '\0';
        }
        destino[strcspn(destino, "\n")] = '\0';
        if (destino[0] == '\0') {
            printf("O texto nao pode ficar vazio.\n");
        }
    } while (destino[0] == '\0');
}

int lerInteiro(const char *msg, int minimo, int maximo) {
    char linha[32];
    int valor;

    while (1) {
        printf("%s", msg);
        if (fgets(linha, sizeof(linha), stdin) != NULL &&
            sscanf(linha, "%d", &valor) == 1 &&
            valor >= minimo && valor <= maximo) {
            return valor;
        }
        printf("Valor invalido. Digite um numero entre %d e %d.\n", minimo, maximo);
    }
}

char lerGenero(void) {
    char linha[16];

    while (1) {
        printf("Genero (F/M): ");
        if (fgets(linha, sizeof(linha), stdin) != NULL) {
            char c = (char)toupper((unsigned char)linha[0]);
            if (c == 'F' || c == 'M') {
                return c;
            }
        }
        printf("Genero invalido. Digite F ou M.\n");
    }
}

// Funcionalidades 

void cadastrarPaciente(void) {
    Paciente p;
    Fila *f;

    printf("\n--- CADASTRO DE PACIENTE ---\n");
    lerTexto("Nome: ", p.nome, sizeof(p.nome));
    p.genero = lerGenero();
    p.idade = lerInteiro("Idade: ", 0, 130);

    p.gestante = 0;
    p.lactante = 0;
    if (p.genero == 'F') {
        p.gestante = lerInteiro("Gestante (1-sim, 0-nao): ", 0, 1);
        p.lactante = lerInteiro("Lactante (1-sim, 0-nao): ", 0, 1);
    }
    p.necessidadeEspecial = lerInteiro("Necessidade especial (1-sim, 0-nao): ", 0, 1);
    p.obeso = lerInteiro("Obesidade (1-sim, 0-nao): ", 0, 1);

    p.categoria = classificarPaciente(p);
    f = obterFila(p.categoria);

    if (filaCheia(f)) {
        printf("\nFila %s cheia! Nao foi possivel cadastrar.\n", nomeCategoria(p.categoria));
        return;
    }

    gerarSenha(&p);
    inserirPaciente(f, p);

    printf("\nPaciente cadastrado com sucesso!\n");
    printf("Senha gerada: %s (%s)\n", p.senha, nomeCategoria(p.categoria));
}

void consultarProxima(void) {
    for (int c = URGENTE; c >= NORMAL; c--) {
        Fila *f = obterFila(c);
        if (!filaVazia(f)) {
            Paciente *p = &f->dados[f->inicio];
            printf("\nProxima senha: %s (%s) - %s\n", p->senha, nomeCategoria(c), p->nome);
            return;
        }
    }
    printf("\nNao ha pacientes aguardando.\n");
}

void chamarPaciente(void) {
    if (atendimentoAtivo) {
        printf("\nFinalize o atendimento de %s (%s) antes de chamar outro paciente.\n",
               emAtendimento.nome, emAtendimento.senha);
        return;
    }

    for (int c = URGENTE; c >= NORMAL; c--) {
        Fila *f = obterFila(c);
        if (!filaVazia(f)) {
            emAtendimento = removerPaciente(f);
            atendimentoAtivo = 1;

            printf("\n================================\n");
            printf(" CHAMADA DE PACIENTE\n");
            printf("================================\n");
            printf("Nome: %s\n", emAtendimento.nome);
            printf("Senha: %s\n", emAtendimento.senha);
            printf("Categoria: %s\n", nomeCategoria(emAtendimento.categoria));
            printf("================================\n");
            return;
        }
    }
    printf("\nNao ha pacientes aguardando.\n");
}

void finalizarAtendimento(void) {
    if (!atendimentoAtivo) {
        printf("\nNenhum atendimento em andamento.\n");
        return;
    }
    printf("\nAtendimento de %s (%s) finalizado.\n", emAtendimento.nome, emAtendimento.senha);
    atendimentoAtivo = 0;
}

void exibirPainel(void) {
    int mostradas = 0;

    printf("\n================================\n");
    printf(" PAINEL DE ATENDIMENTO\n");
    printf("================================\n");

    if (atendimentoAtivo) {
        printf("Senha chamada: %s\n", emAtendimento.senha);
        printf("Categoria: %s\n", nomeCategoria(emAtendimento.categoria));
    } else {
        printf("Senha chamada: nenhuma\n");
    }

    printf("--------------------------------\n");
    printf("Proximas senhas: ");
    for (int c = URGENTE; c >= NORMAL && mostradas < PROXIMAS; c--) {
        Fila *f = obterFila(c);
        for (int i = f->inicio; i < f->fim && mostradas < PROXIMAS; i++) {
            printf("%s ", f->dados[i].senha);
            mostradas++;
        }
    }
    if (mostradas == 0) {
        printf("nenhuma");
    }
    printf("\n--------------------------------\n");

    printf("Em espera - Urgente: %d\n", quantidadeFila(&urgente));
    printf("Em espera - Preferencial: %d\n", quantidadeFila(&preferencial));
    printf("Em espera - Normal: %d\n", quantidadeFila(&normal));
    printf("================================\n");
}

void menu(void) {
    int opcao;

    do {
        printf("\n===== CLINICA - SENHAS DE ATENDIMENTO =====\n");
        printf("1 - Cadastrar paciente\n");
        printf("2 - Consultar proxima senha\n");
        printf("3 - Chamar paciente\n");
        printf("4 - Finalizar atendimento\n");
        printf("5 - Exibir painel\n");
        printf("0 - Sair\n");
        opcao = lerInteiro("Opcao: ", 0, 5);

        switch (opcao) {
            case 1: cadastrarPaciente(); break;
            case 2: consultarProxima(); break;
            case 3: chamarPaciente(); break;
            case 4: finalizarAtendimento(); break;
            case 5: exibirPainel(); break;
            case 0: printf("\nEncerrando o sistema...\n"); break;
        }
    } while (opcao != 0);
}

int main() {
    inicializarFila(&normal);
    inicializarFila(&preferencial);
    inicializarFila(&urgente);

    menu();
    return 0;
}