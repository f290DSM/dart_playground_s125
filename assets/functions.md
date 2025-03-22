# Functions

Como fora muito enfatizado nas aulas presenciais...

O tipo `Function` representa funções que podem ser armazenadas em variáveis e passadas como argumentos.

> É fundamental enterdermos estes conceitos para a sintaxe do Dart fazer cada vez mais sentido e nossa concepção sobre o Dart mude, para que possamos utilizar as vantagens do Dart para aumentar nosso rendimento no desenvolvimento dos aplicativo em Flutter para entrega dos PIs.

## Funções com parametros posionais obrigatórios

Os parametros devem ser passados obrigatoriamente, com a posição definida na assinatura do método.

```dart
void gerarNumeroDaSorte(String nome}) {
  int numeroDaSorte = Random().nextInt(100);
  print('$nome, seu número da sorte é $numeroDaSorte.');
}
```
### Execução e resultado
```shell
gerarNumeroDaSorte('Vitoria');
Vitoria, seu numero da sore é 56.
```

## Funções com parametros obrigatórios e parametros opcionais

Os parametros devem ser passados obrigatoriamente, com a posição definida na assinatura do método porém, o parametro `limite` por ser informado, ou não.

```dart
void gerarNumeroDaSorte(String nome, [int limite = 100]}) {
  int numeroDaSorte = Random().nextInt(limite);
  print('$nome, seu número da sorte é $numeroDaSorte.');
}
```

> Observe que substituimos o valor contante 100 pela variavel `limite`, como ela tem um `default value`, caso ela não seja informada na chamada da função, o valor padrão será utilizado no lugar da constante 100.

### Execução e resultado
```shell
gerarNumeroDaSorte('Vitoria');
Vitoria, seu numero da sore é 56.

gerarNumeroDaSorte('Vitoria', 10);
Vitoria, seu numero da sore é 9.
```

## Funções com parametros opcionais nomeados

Os parametros opcionais nomeados podem ser passados, ou não.

Com a possibilidade utilização ou não-utilização, obtemos uma grande flexibilidade na criação de métodos, esta flexibilidade nos permite passar os parametros em qualquer ordem, escolher os parametros necessários ou simplesmente não passar nenhum parametro.

> Observe que na função definida abaixo, os 2 parametros são opcionais e nomeados, logo sua utilização é opcional, porém, quando eles forem utilizados é necessário especicá-los pelo seu identificador.

```dart
void gerarNumeroDaSorte({String? nome, int? limite}) {
  int numeroDaSorte = Random().nextInt(limite ??= 100);
  print('${nome ?? 'Anonimo'}, seu número da sorte é $numeroDaSorte');
}
```

> Lembre-se de que se não utilizarmos os parametros opicionais definidos na assinatura, nossos metodos devem ter uma trataiva interna para manipular a ausencia destes valores.

### Execução e resultado
```shell
gerarNumeroDaSorte();
Anonimo, seu numero da sore é 42.

gerarNumeroDaSorte(nome: 'Vitoria');
Vitoria, seu numero da sore é 77.

gerarNumeroDaSorte(limite: 5000);
Anonimo, seu numero da sore é 4563.

gerarNumeroDaSorte(nome: Marina, limite: 300);
Marina, seu numero da sore é 299.

gerarNumeroDaSorte(limite: 300, nome: Marina);
Marina, seu numero da sore é 223.
```
## Funções como tipo

Nestes próximos exemplos iremos tratar as funções como tipo de forma mais detalhada.

### Funçoes atribuidas em variáves

Funções como tipo podem ser armazenadas em variáveis.

```dart
// Declaração de função tradicional
int multiplicador(int valor, int multiplo) {
    return  valor * multiplo;
}

// Atribuição de valor váriável dobro, o valor é uma função anonima.
Function dobro = (int valor) {
    return multiplicador(valor, 2);
}

// Atribuição de valor váriável triplo, o valor também é uma função anonima.
Function triplo = (int valor) {
    return multiplicador(valor, 3);
}

// Declaração de função.
int quadruplo(int valor) {
    return multiplicador(valor, 4);
}

// Declaração de função com arrow function.
int quadruplo(int valor) => multiplicador(valor, 5);

```

### Execução e resultado
```shell
multiplicador(2,2);
4
dobro(4);
8
triplo(5);
15
quadruplo(4);
16
quintuplo(6);
30
```

### Funcões com uutilizam parametros do tipo Function

Vamos criar um exemplo ao qual utilizemos funções como argumentos de função, é estranho... Eu sei!

Mas estamos aqui para conhecer este tipo de utilização de deixar o `ESTRANHO` para trás.

Vamos criar uma função que calcula um média de 4 valores, mas esta função deve ter a capacidade de calcular medias aritmeticas ou medias ponderadas; como a algoritmo de calculo de media é selecionável, vamos tomar posse de conceito de funções como tipo e utilizar um algoritmo de cálculo de média como parametro de uma função.

O parametro recebido é que irá realizar o cálculo da média.

> Abaixo temos as declarações das funções a serem `orquestradas`.

```dart
// Função que possui 5 parametros, 4 deles são os valores e o último um parametro nomeado origatório.
double calcularMedia(
  double a,
  double b,
  double c,
  double d, {
  required Function algoritmo,
}) {
    // A execução da função repassa os dados recebidos como argumento para o método algoritmo; o metodo algoritmo por sua vez é um objeto do tipo Function que foi recebido como argumento e possui a lógica necessária para o cálculo da media e esta lógica já foi definida externamento com as funções calcularMediaAritmetica() ou calcularMediaPonderada
  return algoritmo(a, b, c, d);
}

double calcularMediaAritmetica(double a, double b, double c, double d) {
  return (a + b + c + d) / 4;
}

double calcularMediaPonderada(double a, double b, double c, double d) {
  return (a * 1 + b * 3 + c * 2 + d * 4) / 10;
}

void gerarNumeroDaSorte({String? nome, int? limite}) {
  int numeroDaSorte = Random().nextInt(limite ??= 100);
  print('${nome ?? 'Anonimo'}, seu número da sorte é $numeroDaSorte');
}
```

### Execução e resultado
```shell
var ma = calcularMedia(10, 0, 10, 0, agoritmo: calcularMediaAritmetica);
print(ma);
5.0

var mp = calcularMedia(10, 0, 10, 0, agoritmo: calcularMediaPonderada);
print(mp);
3.0
```
> Observe que os resultados foram alterados com base na alteração do parametro `algoritmo`.

### Uso em Widgets

Ao utilizar Widgets do tipo Buttons, todos eles tem associado a execução de uma função ou evento de toque ou clique, então para criar um componente do tipo Button já é temos como concreto que o Button deve possuir alguma forma de parametrizar o evento de clique ou toque.

Em Flutter, este evento é um atributo do tipo Function ou VoidCallback, então para criar um componente que execute uma ação externa, é necessário utilizar um atributo Function na classe que represente este Button, conforme o exemplo abaixo.

```dart
class Button {
  String? label;
  Function? callBack;

  Button({required this.label, required this.callBack});

  void onClick() {
    callBack!();
  }
}
```

> Observe que a classe que representa o Button possui uma função para ser executada e ela executa o objeto `callBack`, este por sua vez é um atribto do tipo Function e até aqui, você já perdeu alguns fios de cabelo mas acredito que tenha compreendido o conceito base de funções como tipo.

### Classes e P.O.O

Agora você pode conferir os exemplos mais detalhados sobre Functions neste [arquivo](../assets/poo.md).