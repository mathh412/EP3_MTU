# Máquina de Turing Universal (MTU)

**Feito por:** Matheus Henrique, Paula Martins e Eric Donato

Este repositório contém a implementação de uma **Máquina de Turing Universal (MTU)** desenvolvida em **Ruby puro**, como parte dos requisitos práticos da disciplina de Linguagens Formais e Autômatos.

A solução simula o comportamento de um computador programável clássico, sendo capaz de ler a descrição de uma Máquina de Turing específica e uma cadeia de entrada a partir de um arquivo de texto, executando a simulação completa na fita.

## 🚀 Requisitos e Premissas Arquiteturais Atendidas

Para total conformidade com as diretrizes do projeto, o desenvolvimento seguiu as seguintes restrições:
* **Fita Unificada:** O arquivo de entrada combina a codificação da máquina (regras) e a cadeia de dados em uma fita única, separadas exclusivamente pelo caractere `#` (ex: `regras#entrada`).
* **Sem Tabelas ou Hashes na Memória:** A busca por transições de estados ocorre de forma puramente linear e sequencial sobre a própria fita em tempo de execução, emulando o comportamento físico do cabeçote de uma MTU real. Nenhuma estrutura do tipo dicionário, hash ou matriz de transições persistente foi utilizada na memória do Ruby para mapear as regras.
* **Leitura de Arquivos Separados:** As definições de cada máquina e suas respectivas entradas de teste estão isoladas em arquivos de texto externos, sendo carregadas dinamicamente através do argumento de linha de comando (`ARGV`).
* **Sem Bibliotecas Externas:** Código escrito nativamente sem o uso de gems ou dependências de simulação externas.

## 📂 Estrutura do Projeto

O projeto adota uma estrutura plana (*flat layout*) para simplificar a execução e evitar problemas com caminhos de arquivos:

```text
├── main.rb                    # Script principal de execução e interface de terminal
├── mtu.rb                     # Classe com o motor de simulação e lógica da fita
├── mt_regular.txt             # Cenário 1: Máquina para a linguagem a*b*
├── mt_livre_contexto.txt      # Cenário 2: Máquina para a linguagem a^n b^n
├── mt_sensivel_contexto.txt   # Cenário 3: Máquina para a linguagem a^n b^n c^n
└── README.md                  # Documentação do projeto
```
## 🛠️ Como Executar

Certifique-se de ter o Ruby instalado em sua máquina. Para rodar qualquer um dos cenários de teste, execute o script `main.rb` passando o caminho do arquivo de texto correspondente como argumento no terminal:

```bash
# Testar Linguagem Regular (a*b*)
ruby main.rb mt_regular.txt

# Testar Linguagem Livre de Contexto (a^n b^n)
ruby main.rb mt_livre_contexto.txt

# Testar Linguagem Sensível ao Contexto (a^n b^n c^n)
ruby main.rb mt_sensivel_contexto.txt

```

## 📊 Cenários de Teste Implementados

Cada arquivo `.txt` contém as transições codificadas da máquina específica seguidas da cadeia padrão para homologação:

1. **Linguagem Regular ($a^* b^*$):** Valida cadeias com sequências de 'a' seguidas de sequências de 'b'. Entrada padrão configurada: `aabb`.
2. **Linguagem Livre de Contexto ($a^n b^n$):** Garante a paridade quantitativa entre os blocos de 'a' e 'b'. Utiliza marcadores na fita para controle dos pares processados. Entrada padrão configurada: `aabb`.
3. **Linguagem Sensível ao Contexto ($a^n b^n c^n$):** Valida o crescimento estritamente idêntico dos três blocos de símbolos ('a', 'b' e 'c'). Entrada padrão configurada: `aabbcc`.

## 📝 Padrão de Codificação Utilizado

A tradução dos elementos formais da Máquina de Turing seguiu rigorosamente a seguinte convenção de tokens:

* **Estados de Não-Aceitação:** Iniciam com `fa` (ex: `fa`, `faa`, `faaa`).
* **Estados de Aceitação:** Iniciam com `fb` (ex: `fb`, `fbb`).
* **Símbolos da Fita:** Sequências iniciadas com `s` seguidas de `c` (ex: `sc`, `scc`, `sccc`).
* **Símbolo Branco:** Representado pelo caractere `_`.
* **Movimentos do Cursor:** `d` (Direita) e `e` (Esquerda).
