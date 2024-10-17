# 🐍 Exercícios de lógica de programação

Este README contém soluções progressivas para exercícios comuns de programação em Python, organizadas do mais simples ao mais complexo. Execute cada célula separadamente no Google Colab para testar as soluções.

## 📋 Sumário

- 🐍

  - [Números Pares](#números-pares)
  - [Jogo de Adivinhação](#jogo-de-adivinhação)
  - [Caixa Eletrônico](#caixa-eletrônico)
  - [Calculadora de Multa](#calculadora-de-multa)

- Mais:
  - [📌 Notas](#-notas)
  - [💡 Dicas](#-dicas)
  - [🔄 Para Limpar Variáveis](#-para-limpar-variáveis)

## Números Pares

**Enunciado:** Criar um algoritmo que encontre todos os números pares entre dois números informados pelo usuário através de um input.

```python
# Solução Básica - List Comprehension
def pares_simples():
    inicio = int(input("Início: "))
    fim = int(input("Fim: "))
    pares = [num for num in range(inicio, fim + 1) if num % 2 == 0]
    print(f"Números pares: {pares}")

pares_simples()
```

```python
# Solução Otimizada - Range
def pares_otimizado():
    inicio = int(input("Início: "))
    fim = int(input("Fim: "))
    inicio = inicio + (inicio % 2)
    print("Números pares:", *range(inicio, fim + 1, 2))

pares_otimizado()
```

```python
# Solução Avançada - Com Validação e Melhorias
class ProcessadorPares:
    def processar(self, inicio, fim):
        try:
            inicio, fim = int(inicio), int(fim)
            if inicio > fim:
                inicio, fim = fim, inicio
            return [num for num in range(inicio + (inicio % 2), fim + 1, 2)]
        except ValueError:
            return "Entrada inválida. Digite números inteiros."

proc = ProcessadorPares()
inicio = input("Início: ")
fim = input("Fim: ")
resultado = proc.processar(inicio, fim)
print(f"Pares encontrados: {resultado}")
```

## Jogo de Adivinhação

**Enunciado:** Dado um número alvo (_target_), o usuário deve tentar adivinhar o número correto. Se o número informado for menor ou maior que o _target_, o programa deverá informar ao usuário e pedir outra tentativa, até que ele acerte.

```python
# Solução Básica
def adivinhar_simples():
    alvo = 42
    while True:
        try:
            palpite = int(input("Seu palpite: "))
            if palpite == alvo:
                print("Acertou!")
                break
            print("Muito " + ("baixo" se palpite < alvo else "alto"))
        except ValueError:
            print("Entrada inválida. Digite um número.")

adivinhar_simples()
```

```python
# Solução Intermediária
from random import randint

def adivinhar_medio():
    alvo = randint(1, 100)
    tentativas = 0
    while True:
        tentativas += 1
        try:
            palpite = int(input(f"Tentativa {tentativas}. Seu palpite: "))
            if palpite == alvo:
                print(f"Acertou em {tentativas} tentativas!")
                break
            print(f"O número é {'maior' se palpite < alvo else 'menor'}")
        except ValueError:
            print("Entrada inválida. Digite um número válido.")

adivinhar_medio()
```

```python
# Solução Avançada
from random import randint

class JogoAdivinhacao:
    def __init__(self, minimo=1, maximo=100):
        self.minimo = minimo
        self.maximo = maximo
        self.reset()

    def reset(self):
        self.numero = randint(self.minimo, self.maximo)
        self.tentativas = 0
        self.game_over = False

    def tentar(self, palpite):
        if self.game_over:
            return "Jogo finalizado! Use .reset() para jogar novamente."

        try:
            palpite = int(palpite)
            self.tentativas += 1

            if palpite == self.numero:
                self.game_over = True
                return f"Acertou em {self.tentativas} tentativas!"

            return f"O número é {'maior' se palpite < self.numero else 'menor'}!"
        except ValueError:
            return "Entrada inválida. Digite um número válido."

# Teste
jogo = JogoAdivinhacao()
print(f"Adivinhe o número entre {jogo.minimo} e {jogo.maximo}")
while not jogo.game_over:
    print(jogo.tentar(input("Seu palpite: ")))
```

## Caixa Eletrônico

**Enunciado:** Criar um programa para um caixa eletrônico que pergunta ao usuário o valor de saque e informa quantas notas de cada valor serão fornecidas. O valor mínimo permitido é de 10 reais e o máximo é 600 reais. As notas disponíveis são de 1, 5, 10, 50 e 100 reais.

**Exemplo:**

- Para o valor de 256 reais, o programa deve fornecer: duas notas de 100, uma nota de 50, uma de 5 e uma de 1.
- Para o valor de 399 reais, o programa deve fornecer: três notas de 100, uma nota de 50, quatro de 10, uma de 5 e quatro de 1.

```python
# Solução Básica
def saque_simples():
    try:
        valor = int(input("Valor do saque: "))
        if not 10 <= valor <= 600:
            print("Valor inválido. Deve estar entre 10 e 600.")
            return

        notas = [100, 50, 10, 5, 1]
        for nota in notas:
            qtd = valor // nota
            if qtd:
                print(f"{qtd} nota(s) de R${nota}")
            valor %= nota
    except ValueError:
        print("Entrada inválida. Digite um valor numérico.")

saque_simples()
```

```python
# Solução Intermediária
def calcular_saque(valor):
    if not isinstance(valor, int) or not 10 <= valor <= 600:
        return "Valor inválido. Digite um valor entre 10 e 600."

    notas = [100, 50, 10, 5, 1]
    resultado = {nota: valor // nota for nota in notas if valor // nota > 0}
    valor %= nota
    return resultado

# Teste
try:
    valor = int(input("Valor: "))
    resultado = calcular_saque(valor)
    print(resultado)
except ValueError:
    print("Entrada inválida. Digite um valor numérico.")
```

```python
# Solução Avançada
class Caixa:
    def __init__(self):
        self.notas = (100, 50, 10, 5, 1)
        self.limites = (10, 600)

    def calcular(self, valor):
        try:
            valor = int(valor)
            if not self.limites[0] <= valor <= self.limites[1]:
                raise ValueError("Valor fora dos limites.")

            resultado = {}
            for nota in self.notas:
                qtd = valor // nota
                if qtd > 0:
                    resultado[nota] = qtd
                    valor %= nota
            return resultado

        except ValueError as e:
            return {"erro": str(e)}

# Teste
caixa = Caixa()
valor = input("Valor do saque: ")
print(caixa.calcular(valor))
```

## Calculadora de Multa

**Enunciado:** João, Papo-de-Pescador, comprou um microcomputador para controlar o rendimento diário de seu trabalho. Toda vez que ele traz um peso de peixes maior que o limite estabelecido de 50 quilos, ele precisa pagar uma multa de R$ 4,00 por cada quilo excedente. Desenvolva um programa que leia o peso dos peixes e calcule o valor da multa, caso exista.

```python
# Solução Básica
def calcular_multa_simples():
    try:
        peso = float(input("Peso dos peixes (kg): "))
        excesso = max(0, peso - 50)
        multa = excesso * 4
        print(f"Multa a pagar: R${multa:.2f}" if multa else "Sem multa.")
    except ValueError:
        print("Entrada inválida. Digite o peso corretamente.")

calcular_multa_simples()
```

```python
# Solução Intermediária
def calcular_multa(peso):
    LIMITE, TAXA = 50, 4
    try:
        peso = float(peso)
        if peso < 0:
            return "Peso inválido. Não pode ser negativo."
        excesso = max(0, peso - LIMITE)
        return {"excesso": excesso, "multa": excesso * TAXA}
    except ValueError:
        return {"erro": "Entrada inválida. Digite um número válido."}

# Teste
resultado = calcular_multa(input("Peso dos peixes (kg): "))
print(resultado)
```

```python
# Solução Avançada
class Pescaria:


 def __init__(self, limite=50, taxa=4):
        self.limite = limite
        self.taxa = taxa

    def calcular(self, peso):
        try:
            peso = float(peso)
            if peso < 0:
                raise ValueError("Peso não pode ser negativo.")

            excesso = max(0, peso - self.limite)
            return {
                "peso": peso,
                "excesso": excesso,
                "multa": excesso * self.taxa,
                "dentro_limite": excesso == 0
            }

        except ValueError as e:
            return {"erro": str(e)}

# Teste
pescaria = Pescaria()
peso = input("Peso dos peixes (kg): ")
resultado = pescaria.calcular(peso)
print(resultado)
```

## 📌 Notas

- As soluções foram testadas no Google Colab
- Cada célula pode ser executada independentemente
- As soluções avançadas incluem tratamento de erros
- Os resultados são apresentados de forma concisa

## 💡 Dicas

1. Execute uma célula por vez
2. Teste diferentes entradas
3. Observe o tratamento de erros
4. Compare as diferentes abordagens

## 🔄 Para Limpar Variáveis

```python
# Execute esta célula para limpar todas as variáveis
%reset -f
```
