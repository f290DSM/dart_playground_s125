//TODO: Orientação a Objetos

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

void orientacaoAObjetos() {
  print('Orientação a Objetos');
  var user = User(username: 'Fabiano', id: 42);
  var userAnonymous = User.anonimo();

  print(user);
  print(userAnonymous);

  final data = DateTime.now();
  print(data);
}
