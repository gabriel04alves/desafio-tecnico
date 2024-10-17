# 🐍 Exercícios Python - Soluções Progressivas

[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/#)

Este README contém soluções progressivas para exercícios comuns de programação em Python, organizadas do mais simples ao mais complexo. Execute cada célula separadamente no Google Colab para testar as soluções.

## 📋 Sumário

1. [Números Pares](#números-pares)
2. [Jogo de Adivinhação](#jogo-de-adivinhação)
3. [Caixa Eletrônico](#caixa-eletrônico)
4. [Calculadora de Multa](#calculadora-de-multa)

## Números Pares

### Problema

Encontrar números pares entre dois números informados pelo usuário.

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
    inicio = inicio if inicio % 2 == 0 else inicio + 1
    print("Números pares:", *range(inicio, fim + 1, 2))

pares_otimizado()
```

```python
# Solução Avançada - Com Validação
class ProcessadorPares:
    def processar(self, inicio, fim):
        try:
            inicio, fim = int(inicio), int(fim)
            if inicio > fim:
                inicio, fim = fim, inicio
            return list(range(inicio + (inicio % 2), fim + 1, 2))
        except ValueError:
            return []

# Teste
proc = ProcessadorPares()
inicio = input("Início: ")
fim = input("Fim: ")
resultado = proc.processar(inicio, fim)
print(f"Pares encontrados: {resultado}")
```

## Jogo de Adivinhação

### Problema

Criar um jogo onde o usuário deve adivinhar um número alvo.

```python
# Solução Básica
def adivinhar_simples():
    alvo = 42
    while True:
        palpite = int(input("Seu palpite: "))
        if palpite == alvo:
            print("Acertou!")
            break
        print("Muito " + ("baixo" if palpite < alvo else "alto"))

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
            print(f"O número é {'maior' if palpite < alvo else 'menor'}")
        except ValueError:
            print("Digite um número válido!")

adivinhar_medio()
```

```python
# Solução Avançada
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
            return "Jogo finalizado! Use .reset() para jogar novamente"

        try:
            palpite = int(palpite)
            self.tentativas += 1

            if palpite == self.numero:
                self.game_over = True
                return f"Acertou em {self.tentativas} tentativas!"

            dica = "maior" if palpite < self.numero else "menor"
            return f"O número é {dica}!"

        except ValueError:
            return "Digite um número válido!"

# Teste
jogo = JogoAdivinhacao()
print(f"Adivinhe o número entre {jogo.minimo} e {jogo.maximo}")
while not jogo.game_over:
    print(jogo.tentar(input("Seu palpite: ")))
```

## Caixa Eletrônico

### Problema

Calcular quantidade de notas para um saque (10-600 reais).

```python
# Solução Básica
def saque_simples():
    valor = int(input("Valor do saque: "))
    if not 10 <= valor <= 600:
        print("Valor inválido")
        return

    notas = [100, 50, 10, 5, 1]
    for nota in notas:
        qtd = valor // nota
        if qtd:
            print(f"{qtd} nota(s) de R${nota}")
        valor %= nota

saque_simples()
```

```python
# Solução Intermediária
def calcular_saque(valor):
    if not isinstance(valor, int) or not 10 <= valor <= 600:
        return "Valor inválido"

    notas = [100, 50, 10, 5, 1]
    return {nota: valor // nota for nota in notas if valor // nota > 0}

# Teste
try:
    valor = int(input("Valor: "))
    resultado = calcular_saque(valor)
    print(resultado)
except ValueError:
    print("Digite um valor válido")
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
                raise ValueError("Valor fora dos limites")

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

### Problema

Calcular multa por excesso de peso em peixes (limite: 50kg, multa: R$4/kg).

```python
# Solução Básica
def calcular_multa_simples():
    peso = float(input("Peso dos peixes (kg): "))
    excesso = max(0, peso - 50)
    multa = excesso * 4
    print(f"Multa a pagar: R${multa:.2f}" if multa else "Sem multa")

calcular_multa_simples()
```

```python
# Solução Intermediária
def calcular_multa(peso):
    LIMITE, TAXA = 50, 4
    try:
        peso = float(peso)
        if peso < 0:
            return "Peso inválido"
        excesso = max(0, peso - LIMITE)
        return {"excesso": excesso, "multa": excesso * TAXA}
    except ValueError:
        return {"erro": "Entrada inválida"}

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
                raise ValueError("Peso não pode ser negativo")

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
