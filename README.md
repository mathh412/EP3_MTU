
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
