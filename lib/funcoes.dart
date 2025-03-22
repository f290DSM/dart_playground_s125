//TODO: Funções

import 'dart:math';

void exemploFuncoes() {
  gerarNumeroDaSorte(nome: 'Claudemir');

  var media = calcularMedia(10, 0, 10, 0, algoritmo: calcularMediaAritmetica);
  print(media);
    var media1 = calcularMedia(10, 0, 10, 0, algoritmo: calcularMediaPonderada);
  print(media1);

  int dobro(int v) => multiplicador(v, 2);

  Function triplo = (int v) => multiplicador(v, 3);

  print(dobro(30));
  print(triplo(30));
}

int multiplicador(int valor, int multiplo) => valor * multiplo;

double calcularMedia(
  double a,
  double b,
  double c,
  double d, {
  required Function algoritmo,
}) {
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

class Button {
  String? label;
  Function? callBack;

  Button({required this.label, required this.callBack});

  void onClick() {
    callBack!();
  }
}
