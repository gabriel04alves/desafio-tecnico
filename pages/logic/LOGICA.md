# 🐍 Apostila de Conceitos de Python

Esta apostila cobre os conceitos de Python mais usados em desafios técnicos de lógica, começando do nível iniciante até o intermediário avançado. A ideia é proporcionar uma base sólida, focada em conceitos que frequentemente aparecem em entrevistas técnicas para estágios e cargos júnior em desenvolvimento de software.

## 📋 Sumário

- ...
  - [Variáveis e Tipos de Dados](#variáveis-e-tipos-de-dados)
  - [Operadores](#operadores)
  - [Estruturas Condicionais](#estruturas-condicionais)
  - [Estruturas de Repetição](#estruturas-de-repetição)
  - [Funções](#funções)
  - [List Comprehension](#list-comprehension)
  - [Manipulação de Strings](#manipulação-de-strings)
  - [Listas e Tuplas](#listas-e-tuplas)
  - [Dicionários](#dicionários)
  - [Funções Lambda](#funções-lambda)
  - [Map, Filter e Reduce](#map-filter-e-reduce)
  - [Funções Recursivas](#funções-recursivas)
  - [Exceções e Tratamento de Erros](#exceções-e-tratamento-de-erros)
- [📌 Conclusão](#-conclusão)

### [🔗 Acesse os Exercícios de Lógica de Programação](/QTSLOGICA.md)

---

### Variáveis e Tipos de Dados

Variáveis são usadas para armazenar valores em Python, e os tipos de dados definem o tipo de valor que uma variável pode conter. Os principais tipos são:

- **int**: números inteiros.
- **float**: números com ponto flutuante (decimais).
- **str**: strings (cadeias de caracteres).
- **bool**: valores booleanos (`True` ou `False`).

```python
x = 10  # int
y = 3.14  # float
nome = "Python"  # str
ativo = True  # bool
```

---

### Operadores

Operadores são usados para realizar operações em variáveis e valores.

- **Aritméticos**: `+`, `-`, `*`, `/`, `//` (divisão inteira), `%` (módulo), `**` (exponenciação).

  ```python
  resultado = 10 + 5  # 15
  ```

- **Comparação**: `==`, `!=`, `>`, `<`, `>=`, `<=`.

  ```python
  print(10 > 5)  # True
  ```

- **Lógicos**: `and`, `or`, `not`.

  ```python
  print(True and False)  # False
  ```

---

### Estruturas Condicionais

Permitem a execução de diferentes blocos de código dependendo de condições específicas. A estrutura mais comum é o `if`, `elif`, `else`.

```python
idade = int(input("Digite sua idade: "))

if idade >= 18:
    print("Você é maior de idade.")
else:
    print("Você é menor de idade.")
```

---

### Estruturas de Repetição

Estruturas de repetição permitem executar um bloco de código várias vezes:

- **for**: usado para iterar sobre sequências (listas, tuplas, strings, etc.).

  ```python
  for i in range(5):
      print(i)
  ```

- **while**: repete enquanto uma condição for verdadeira.

  ```python
  contador = 0
  while contador < 5:
      print(contador)
      contador += 1
  ```

---

### Funções

Funções são blocos de código que podem ser reutilizados. Podem receber parâmetros e retornar valores.

```python
def saudacao(nome):
    return f"Olá, {nome}!"

print(saudacao("João"))
```

- **Parâmetros Opcionais**: parâmetros que têm valores padrão.

  ```python
  def saudacao(nome="Amigo"):
      return f"Olá, {nome}!"
  ```

---

### List Comprehension

Uma forma compacta e poderosa de criar listas aplicando transformações ou filtros.

```python
numeros = [1, 2, 3, 4, 5]
quadrados = [x**2 for x in numeros]
print(quadrados)  # [1, 4, 9, 16, 25]
```

Com condição:

```python
pares = [x for x in numeros if x % 2 == 0]
print(pares)  # [2, 4]
```

---

### Manipulação de Strings

Python oferece várias maneiras de manipular strings, como fatiamento, junção e formatação.

```python
nome = "Python"
print(nome[0:3])  # "Pyt"
print(nome.upper())  # "PYTHON"
print(f"Bem-vindo ao {nome}!")  # "Bem-vindo ao Python!"
```

---

### Listas e Tuplas

- **Listas**: mutáveis (podem ser alteradas) e podem conter diferentes tipos de dados.

  ```python
  frutas = ["maçã", "banana", "laranja"]
  frutas.append("uva")
  print(frutas)  # ["maçã", "banana", "laranja", "uva"]
  ```

- **Tuplas**: imutáveis (não podem ser alteradas após a criação).

  ```python
  cores = ("vermelho", "azul", "verde")
  print(cores[1])  # "azul"
  ```

---

### Dicionários

Dicionários armazenam dados em pares chave-valor. São úteis para armazenar relacionamentos entre dados.

```python
aluno = {"nome": "Carlos", "idade": 20, "curso": "Engenharia"}
print(aluno["nome"])  # "Carlos"
```

---

### Funções Lambda

Funções anônimas, ou lambdas, são úteis para expressar pequenas funções de forma concisa.

```python
dobro = lambda x: x * 2
print(dobro(5))  # 10
```

---

### Map, Filter e Reduce

Funções funcionais aplicadas a iteráveis:

- **map**: aplica uma função a todos os itens de um iterável.

  ```python
  numeros = [1, 2, 3, 4]
  quadrados = list(map(lambda x: x**2, numeros))
  print(quadrados)  # [1, 4, 9, 16]
  ```

- **filter**: filtra elementos de um iterável com base em uma função.

  ```python
  pares = list(filter(lambda x: x % 2 == 0, numeros))
  print(pares)  # [2, 4]
  ```

- **reduce**: reduz um iterável a um único valor, acumulando resultados (importado de `functools`).

  ```python
  from functools import reduce
  soma = reduce(lambda x, y: x + y, numeros)
  print(soma)  # 10
  ```

---

### Funções Recursivas

Funções que chamam a si mesmas. Muito usadas em problemas de lógica que envolvem divisões repetidas de um problema maior (ex: fatoriais, Fibonacci, etc.).

```python
def fatorial(n):
    if n == 0:
        return 1
    return n * fatorial(n - 1)

print(fatorial(5))  # 120
```

---

### Exceções e Tratamento de Erros

Em Python, usamos `try`, `except` e `finally` para tratar exceções e evitar que erros interrompam a execução do código.

```python
try:
    numero = int(input("Digite um número: "))
    print(f"O número é {numero}")
except ValueError:
    print("Valor inválido. Digite um número inteiro.")
```

---

## 📌 Conclusão

Estes conceitos cobrem uma vasta gama de tópicos que são frequentemente abordados em questões de lógica e desafios técnicos em entrevistas para estágios ou posições júnior de desenvolvedor. Estude cada um desses conceitos, pratique bastante com exercícios de lógica, e prepare-se para aplicá-los em situações práticas!

### [🔗 Acesse os Exercícios de Lógica de Programação](../pages/QTSLOGICA.md)
