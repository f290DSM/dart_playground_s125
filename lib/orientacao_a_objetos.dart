//TODO: Orientação a Objetos

import 'dart:math';

void orientacaoAObjetos() {
  print('Orientação a Objetos');
  var user = User(username: 'Fabiano', id: 42);
  var userAnonymous = User.anonimo();

  print(user);
  print(userAnonymous);

  final data = DateTime.now();
  print(data);
}

class User {
  int? _id;
  String? _username;

  set id(int? id) => _id = id;
  int? get id => _id;

  set username(String? username) => _username = username;
  String? get username => _username;

  User({int? id, String? username}) : _id = id, _username = username;

  User.anonimo() {
    _username = 'Anônimo';
    _id = 0;
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username)';
  }
}
