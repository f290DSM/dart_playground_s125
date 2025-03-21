void tipoDeDados() {
  //TODO: Tipos de dados

  // Strings
  // Declaracao tipada
  String nome = 'João';

  // Declaracao inferida
  var idade = 20;

  // Interpolacao
  print('Nome: $nome, idade: $idade, seu nome tem ${nome.length} caracteres.');

  print('I \u2764 Dart\u0021');
  print('I \u{1FA77} Dart\u{1F3AF}');

  final fraseMultiLinha = '''
  Primei linha
    Segunda     linha
        Terceira linha
  ''';

  print(fraseMultiLinha);

  // Números
  int numeroInteiro = 10;
  double numeroDecimal = 10.5;
  num meuNumero = 10.5;
  num meuOutroNumero = 15;

  print('meuNumero é ${meuNumero.runtimeType}');
  print('meuOutroNumero é ${meuOutroNumero.runtimeType}');

  //TODO: Tipos por Inferencia
  var meuNome = 'João';
  var minhaIdade = 20;
  var minhaAltura = 1.75;

  print('''meuNome: $meuNome: ${meuNome.runtimeType}, 
    minhaIdade: $minhaIdade: ${minhaIdade.runtimeType}, 
    minhaAltura: $minhaAltura: ${minhaAltura.runtimeType}
    ''');
  
  dynamic x = 'João';
  print('x: $x: ${x.runtimeType}');
  x = 20;
  print('x: $x: ${x.runtimeType}');
  x = ['a', 'b', 'c'];
  print('x: $x: ${x.runtimeType}');
  x = {'a': 1, 'b': 2};
  print('x: $x: ${x.runtimeType}');
  x = () => print('Olá');
  print('x: $x: ${x.runtimeType}');

  var onzeEhImpar = 11.isOdd;
  print('11 é impar? $onzeEhImpar');

  print('A minha pretenção salarial é de R\$ ${10000.toStringAsFixed(2)}');
}