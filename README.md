# Introdução ao Dart

> Acesso direto aos conteúdos

Conteúdo | Link
| -- | -- |
| Funções| [acesso](assets/functions.md) |
| Programação Orientada a Objetos | [acesso](assets/poo.md) |
| Null Safety| [work in progress]() |
| Collections| [work in progress]() |
| Programação Assíncrona| [work in progress]() |

## Introdução aos Tipos em Dart

Dart é uma linguagem fortemente tipada, o que significa que cada variável tem um tipo específico. Neste documento, exploraremos os principais tipos básicos da linguagem com exemplos práticos.

## 1. Inferência de Tipos
Dart pode inferir o tipo de uma variável com base no valor atribuído. Isso é feito utilizando a palavra-chave `var`.

```dart
var nome = "Dart"; // Inferido como String
var idade = 30;     // Inferido como int

print(nome.runtimeType); // Saída: String
print(idade.runtimeType); // Saída: int
```

> A inferência de tipos ajuda a tornar o código mais legível sem perder segurança de tipos.

## 2. `final` e `const`
Dart possui os modificadores `final` e `const` para criar variáveis imutáveis.

### `final`
O modificador `final` permite definir uma variável que pode ser inicializada apenas uma vez.

```dart
final String linguagem = "Dart";
final int ano = 2011;

print(linguagem); // Saída: Dart
print(ano); // Saída: 2011
```

> A diferença de `final` para `var` é que, após a atribuição inicial, o valor não pode ser alterado.

### `const`
O modificador `const` cria constantes em tempo de compilação, ou seja, o valor deve ser conhecido no momento da compilação.

```dart
const double pi = 3.14159;
const int maxUsuarios = 1000;

print(pi); // Saída: 3.14159
print(maxUsuarios); // Saída: 1000
```

> A diferença entre `final` e `const` é que `final` pode receber valores em tempo de execução, enquanto `const` deve ser conhecido em tempo de compilação.

#### Exemplo

Considere a criação e exibição de uma variável imutável para a data e hora atual.

```dart
final data = DateTime.now();
print(data);
```

> Este código compila por que a data atual é recebida no momento da execução do código.

```dart
const data = DateTime.now();
print(data);
```

> Este código FALHA por que a data atual só será conhecida em tempo de compilação e o compilador não poderá determinar este valor previamente, pois o momento da compilação é indeterminado e o valor não pode ser atribuido; então para este caso deveremos utilizar o modificador final paea obter o valor em tempo de execução.

## 3. `num`
O tipo `num` é a superclasse dos números em Dart. Ele pode representar tanto inteiros (`int`) quanto números de ponto flutuante (`double`).

```dart
num numero1 = 10;
num numero2 = 5.5;

print(numero1); // Saída: 10
print(numero2); // Saída: 5.5
```

## 4. `int`
O tipo `int` representa números inteiros, ou seja, sem casas decimais.

```dart
int idade = 25;
print(idade); // Saída: 25
```

### Operações comuns com `int`
```dart
int a = 10;
int b = 3;
print(a + b);  // Saída: 13
print(a - b);  // Saída: 7
print(a * b);  // Saída: 30
print(a ~/ b); // Saída: 3 (divisão inteira)
print(a % b);  // Saída: 1 (resto da divisão)
print('11 é impar? ${11.isOdd}'); // Saída: 11 é impar? true
print('10 é par? ${10.isEven}'); //Saída: 10 é par? true
```

## 5. `double`
O tipo `double` representa números de ponto flutuante (com casas decimais).

```dart
double preco = 10.99;
print(preco); // Saída: 10.99
```

### Operações comuns com `double`
```dart
double x = 5.7;
double y = 2.3;
print(x + y); // Saída: 8.0
print(x - y); // Saída: 3.4
print(x * y); // Saída: 13.11
print(x / y); // Saída: 2.4782608695652173
print('A minha pretenção salarial é de R\$ ${10000.toStringAsFixed(2)}'); //Saída: A minha pretenção salarial é de R$ 10000.00
```

## 6. `String`
O tipo `String` representa uma sequência de caracteres.

```dart
String nome = "Dart";
print("Olá, $nome!"); // Saída: Olá, Dart!
```

### Métodos comuns para `String`
```dart
// Interpolacao de dados
print('Nome: $nome, idade: $idade, seu nome tem ${nome.length} caracteres.');

// Utilização de caracteres especiais como Emojs.
print('I \u2764 Dart\u0021');
print('I \u{1FA77} Dart\u{1F3AF}');

// String formatadas com múltiplas linhas.
final fraseMultiLinha = '''
Primei linha
Segunda     linha
    Terceira linha
''';

String texto = "Dart é incrível!";
print(texto.length);     // Saída: 16
print(texto.toUpperCase()); // Saída: DART É INCRÍVEL!
print(texto.toLowerCase()); // Saída: dart é incrível!
print(texto.contains("Dart")); // Saída: true
```

## 7. `List`
O tipo `List` representa uma coleção ordenada de elementos.

> Estes são exemplos básicos sobre Lists, teremos uma aula dedicada para collections mais à frente.

```dart
List<int> numeros = [1, 2, 3, 4, 5];
numeros.add(6);
print(numeros); // Saída: [1, 2, 3, 4, 5, 6]
```

### Métodos comuns para `List`
```dart
List<String> frutas = ["Maçã", "Banana", "Laranja"];
print(frutas.length);   // Saída: 3
print(frutas[1]);       // Saída: Banana
frutas.remove("Maçã"); // Remove "Maçã"
print(frutas);          // Saída: [Banana, Laranja]
```

## 8. `Map`
O tipo `Map` representa uma coleção de pares chave-valor.

> Estes são exemplos básicos sobre Maps, teremos uma aula dedicada para collections mais à frente.

```dart
Map<String, int> idades = {
  "Ana": 30,
  "Pedro": 25,
  "Maria": 28,
};

print(idades["Pedro"]); // Saída: 25
```

### Métodos comuns para `Map`
```dart
idades["João"] = 32; // Adiciona um novo par chave-valor
print(idades.containsKey("Ana")); // Saída: true
print(idades.keys);   // Saída: (Ana, Pedro, Maria, João)
print(idades.values); // Saída: (30, 25, 28, 32)
```

## 9. `Function`
O tipo `Function` representa funções que podem ser armazenadas em variáveis e passadas como argumentos.

```dart
void saudacao(String nome) {
  print("Olá, $nome!");
}

// Observe que o objeto declarado minhFuncao recebe uma função já declarada nas linhas anteriores. Ao executá-la, estamos realizando a execução da função minhaFuncao que é um objeto do tipo saudacao, um void callBack (String{}).
Function minhaFuncao = saudacao;
minhaFuncao("Marina"); // Saída: Olá, Marina!
```

### Funções anônimas

Funções anonimas são funções que não possuem identificadores.

> Onserve que o objeto multiplicar está recebendo uma Função Anonima, logo ele será do tipo (int, int) => int, ou seja uma função que recebe 2 parametros do tipo int e tem seu retorno do tipo int.

```dart
var multiplicar = (int a, int b) => a * b;
print(multiplicar(3, 4)); // Saída: 12
```

## 10. `dynamic`
O tipo `dynamic` permite armazenar valores de qualquer tipo, mas deve ser usado com cautela, pois desativa a verificação de tipos em tempo de compilação.

> Discutiremos a validação de tipos em tempo de compilação em outro momento.

```dart

### Verificando o tipo de uma variável `dynamic`
```dart
dynamic x = 'Ahsoka';
print('x: $x: ${x.runtimeType}');
x = 20;
print('x: $x: ${x.runtimeType}');
x = ['a', 'b', 'c'];
print('x: $x: ${x.runtimeType}');
x = {'a': 1, 'b': 2};
print('x: $x: ${x.runtimeType}');
x = () => print('Olá');
print('x: $x: ${x.runtimeType}');
```
---

## Conclusão
Dart oferece uma variedade de tipos de dados para manipulação eficiente de valores. Compreender esses tipos é essencial para o desenvolvimento de aplicativos robustos e eficientes.

### Functions

Agora você pode conferir os exemplos mais detalhados sobre Functions neste [arquivo](assets/functions.md).



