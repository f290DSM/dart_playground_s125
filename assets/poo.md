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

## Herança

Assim como nas demais linguagens orientadas à objetos, o Dart possui o pilar da herança.

> Vamos reproveitar a classe User como uma classe base para a criação de uma família de classes.

### Alterando a classe pai

Inclua o modificador abstract na classe base.

```dart
// Inclusão do modificador abstract
abstract class User {
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

  User({required int? id, required String? username})
    : _id = id,
      _username = username;

  User.anonimo() {
    _username = 'Anônimo';
    _id = 0;
  }

  String get obscurePassword => "*" * _username!.length;

  @override
  String toString() {
    return 'User(id: $_id, username: $_username)';
  }
}
```

#### Execução e resultado
```shell
  var user = User(username: 'Fabiano', id: 42);
  var userAnonymous = User.anonimo();
  print(user);
  print(userAnonymous);

User(id: 42, username: Fabiano)
User(id: 0, username: Anônimo)
```

### Criando a classe filha Moderator

Assim como nas demais linguagens, utilizamos a extensão, palavra reservada `extends` para reutilizar a classe pai como base da classe Moderator, assim como seus atributos, métodos e construtores.

A classe terá um comportamento próprio, o `moderação` de usuários.

```dart
class Moderator extends User {
  Moderator({required super.id, required super.username});

  void moderate(User user) {
    print('Moderating user ${user.username}');
  }
}
```

#### Execução e resultado
```shell
final moderator = Moderator(id: 2, username: 'Moderator');
print(moderator);
moderator.moderate(User.anonimo());

User(id: 2, username: Moderator)
Moderating user Anônimo
```

### Criando a classe filha Admin

Assim como Moderator, Admin terá seus próprios comportamentos, sen eles adicionar e excluir usuários.

```dart
class Admin extends User {
  Admin({required super.id, required super.username});

  void delete(User user) {
    print('Deleting user ${user.username}');
  }

  void add(User user) {
    print('Adding user ${user.username}');
  }
  
  @override
  void notify(User user) {
    print('Notifying user ${user.username}');
  }
}
```

#### Execução e resultado
```shell
final admin = Admin(id: 1, username: 'Admin');
admin.add(user);
admin.delete(user);
print(admin);

User(id: 1, username: Admin)
Adding user Fabiano
Deleting user Fabiano
```

### Interfaces

As interfaces em Dart, também são como as demais linguagens; elas permitem a criação interfaces para implementação, contratos ou delegates, dependendo da linguagem à qual se compare.

> As interfaces possibilitam a flexibilização de hierarquia de classes, a compatibilização de tipos complexos e é o pilar da inversão de controle ou dependencia.

```dart
abstract interface class Notify {
  void notify(User user);
}
```

#### Vamos fazer com que as classes Moderator e Admin implementem a interface Notify.

Altere a classe Moderator fazendo com que ela assine o contrato Notify e cumpra-o implementado o método `notify(user)`.

```dart
class Moderator extends User implements Notify {
  Moderator({required super.id, required super.username});
  // ... Resto do código implementado acima
  @override
  void notify(User user) {
    print('Notifying user ${user.username}');
  }
}

class Admin extends User implements Notify {
  Admin({required super.id, required super.username});
  // ... Resto do código implementado acima
  @override
  void notify(User user) {
    print('Notifying user ${user.username}');
  }
}
```

#### Execução e resultado
```shell
moderator.notify(user);
admin.notify(user);

Notifying user Fabiano
Notifying user Fabiano
```

## Mixin

As linguagens de programação tradicionais permitem a extensão de apenas uma classe, impossibilitando a herança múltipla.

O Dart possui o `mixin` que permite a combinação de classes sem restriçoes, podendo adequar facilmente familias de classes complexas compartilhando atributos e comportamentos já implementados, diferentemente do uso de intefaces.

### Criando um mixin

Use a palavra reservada mixin no lugar de class.

```dart
mixin SuperUser {
  void block(User user) {
    print('Blocking user ${user.username}');
  }

  void unblock(User user) {
    print('Unblocking user ${user.username}');
  }
}
```

#### Aplicando mixin ao Moderator

Utilizamos a palavra reservada With para combinar a classe Moderator com SuperUser.

```dart
class Moderator extends User with SuperUser implements Notify {
  Moderator({required super.id, required super.username});
  // ... código já implementado
}
```

#### Vamos testar os comportamentos de Moderator combinados SuperUser e Notify.

Observe que o bloqueio e desbloqueio vieram de SuperUser com uma implementação concreta.

#### Execução e resultado
```shell
moderator.moderate(user);
moderator.block(user);
moderator.unblock(user);
moderator.notify(user);

Moderating user Fabiano
Blocking user Fabiano
Unblocking user Fabiano
Notifying user Fabiano
```
## Extensions

As extensões possibilitam que você crie comportamentos em classes existentes, sem afetá-las.

Considerando a classe estável String, nativa do Dart; vamos supor que você quisesse incluir um novo comportamento diretamente na classe String; com certeza a equipe do Google Dart não iria permitir!

Mas caso seja necessário incluir um comportamento na classe String, as extensions resolveriam este problema.

Imagine que voce precisasse de um método que iria apresentar Strings em `caixa-alta separadas por um espaço em branco entre os caratcteres`, para este caso você precisaria de um Utilitário de Strings proprietário, algo como `MeuProjetoStringUtils.dart` e um método próprio para isso.

O dart permite que voce crie uma extensão da classe sagrada String e utilize o seu método diretamente sobre ela.

### Criando uma extension

Em qualquer classe de seu projeto, adicione o código abaixo.

> Este método incluirá a computed property `separatedChars` diretamente sobre a classe String, como uma extenção

```dart
extension StringExtension on String {
  String get separatedChars {
    String separated = '';
    // Faz um loop nos caracteres da String
    split('').forEach((element) {
      // Aplica caixa alta e concatena um espaço em branco no final
      separated += '${element.toUpperCase()} ';
    });
    // Retorna a String formatada e remove os espaços em branco do inínio e final
    return separated.trim();
  }
}
```

#### Execução e resultado
```shell
print(moderator.username!.separatedChars);

M O D E R A T O R
```

> Observe que da computed property foi chamada à partir do getter username que é uma String, e a extensão da classe String nos forneceu a string formatada diretamente do próprio valor do objeto, o conteúdo `Moderator`.

# Parabéns por chegar até aqui, concluímos os principais fundamentos do Dart.

## Nossos próximos conteúdos serão Collections e Programação Assincrona, até breve!

