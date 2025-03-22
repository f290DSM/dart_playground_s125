# Classes e P.O.O

## P.O.O

O paradigma de Programação Orientada a Objetos é fundamental para a criação de aplicações mais fáceis de manter, reutilizar e evoluir.

Iremos verificar os principais conceitos da P.O.O em Dart para facilitar a criação de Apps em Flutter.

> O Dart oferrece algumas vantagens com relação às linguagens mais coinhecidas como Java, como por exemplo os contrutores nomeados, fowards constructors, flexibilização de param,etros, herança múltipla com Mixins, dentre outras. 

## Classes

Assim como nas demais linguagens, as classes em dart são estruturas que definem atributos e comportamentos; estes são utilizados para encapsular regras de negócio que irão reger nossas aplicações.

Vamos criar uma classe simples para exemplificar estes conceitos.

```dart
class User {
  int? id;
  String? username;

  @override
  String toString() {
    return 'User(id: $id, username: $username)';
  }
}
```

> Vamos pular o Null Safety momentaneamente.

### Construtores de classe

Os contrutores servem para padronizar e facilitar a criação de instancias, variando e flexibilizando a criações de objetos.

#### Construtor Padrão

O construtor padrão é o construtor primário, o construtor mais utilizado de uma classe.

```dart
class User {
  int? id;
  String? username;

  // Construtor padrão
  User({this.id, this.username});

  @override
  String toString() {
    return 'User(id: $id, username: $username)';
  }
}
```

#### Construtor Nomeado

O construtor nomeado é um construtor secundário, ele é  mais utilizado para variaçoes específicas de instanciações.

```dart
class User {
  int? id;
  String? username;

  // Construtor padrão
  User({this.id, this.username});

  // Construtor nomeado
  User.annonymous() {
    id = 0;
    username = 'Aonimo';
  }

  // Construtor nomeado com forward statement
  User.anonimo(): User(id: 0, username: 'Anonimo');

  @override
  String toString() {
    return 'User(id: $id, username: $username)';
  }
}
```

### Getters e Setters

O Dart simplifica a criação de getters e setters, todos os atriutos são públicos por padrão.

Para privar o acesso à um atributo, devemos utilizar o prefixo `_`, por exemplo um atributo encapsulado teria a sintaxe abaixo.

```dart
String _senha;
```

Com o acesso privado, devemos fornecee acesso à este atributo por meio de getters e setters.

#### Privando os atributos

No exemplo abaixo estamos privando os atributos de classe para gerarmos os getters e setters logo a seguir.

```dart
class User {
  // Privamos o acesso externo com o prefixo underline.
  int? _id;
  String? _username;

  // Presisamos alterar o constutor padrão para receber argumentos e utilizar o forward constructor, encaminhando os parametros de entrada para os atributos privados pois, não podemos conceder acesso externo dos nossos atributos privados.
  User({int? id, String? username}) : _id = id, _username = username;

  // Alteramos também o contrutor anonimo.
  User.anonimo() {
    _username = 'Anônimo';
    _id = 0;
  }

  @override
  String toString() {
    //Alteramos o para os atributos privados
    return 'User(id: $_id, username: $_username)';
  }
}
```

#### Criando Getters e Setters

Os getters e setters são uma facilitação para a criação de metodos de acesso e modificação para atributos privados.

Praticamente utilizamos as palavras reservadas `get` e `set` sobre funções para que eles atuem como getters e setters.

```dart
class User {
  int? _id;
  String? _username;

  // Criando acesso publico ao atributo _id
  int? get id => _id;

  // Criando modificador publico ao atributo _id
  set id(int? id) {
    if (id != null && id > 0) _id = id;
  }

  // Criando acesso publico ao atributo _username
  String? get username => _username;

  // Criando modificador publico ao atributo username
  set username(String? username) {
    if (username != null && username.length > 3) _username = username;
  }

  User({required int? id, required String? username}) : _id = id, _username = username;
  
  User.anonimo() {
    _username = 'Anônimo';
    _id = 0;
  }

  @override
  String toString() {
    return 'User(id: $_id, username: $_username)';
  }
}
```

### Computed Properties

Uma computed property (ou propriedade calculada) é um getter que retorna um valor com base em outros atributos da classe, em vez de armazenar diretamente um valor em uma variável.

```dart
class User {
  int? _id;
  String? _username;
  String? _password;

  String get obscurePassword => "*" _password!.length;

  @override
  String toString() {
    return 'User(id: $_id, username: $_username)';
  }
}
```

> Temos uma computed property que retorna um `obscurePassword` aproveitando um atributo existente e o `get`.
