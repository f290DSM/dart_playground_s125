//TODO: Orientação a Objetos

import 'dart:math';

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

class Moderator extends User with SuperUser implements Notify {
  Moderator({required super.id, required super.username});

  void moderate(User user) {
    print('Moderating user ${user.username}');
  }
  
  @override
  void notify(User user) {
    print('Notifying user ${user.username}');
  }
}

class Admin extends User implements Notify {
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

mixin SuperUser {
  void block(User user) {
    print('Blocking user ${user.username}');
  }

  void unblock(User user) {
    print('Unblocking user ${user.username}');
  }
}

abstract interface class Notify {
  void notify(User user);
}

class DefaultUser extends User {
  DefaultUser({required super.id, required super.username});
  DefaultUser.anonimo() : super(id: 0, username: 'Anônimo');
}

void orientacaoAObjetos() {
  print('Orientação a Objetos');
  var user = DefaultUser(username: 'Fabiano', id: 42);
  var userAnonymous = DefaultUser.anonimo();

  print(user);
  print(userAnonymous);

  final data = DateTime.now();
  print(data);

  final admin = Admin(id: 1, username: 'Admin');
  print(admin);
  admin.add(user);
  admin.delete(user);
  admin.notify(user);

  final moderator = Moderator(id: 2, username: 'Moderator');
  moderator.moderate(user);
  moderator.block(user);
  moderator.unblock(user);
  moderator.notify(user);
  print('-------------');
  print(moderator);
  moderator.moderate(userAnonymous);

  print('--------');
  print(moderator.username!.separatedChars);

}

extension StringExtension on String {
  String get separatedChars {
    String separated = '';
    split('').forEach((element) {
      separated += '${element.toUpperCase()} ';
    });
    return separated.trim();
  }
}
