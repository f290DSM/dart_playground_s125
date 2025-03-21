//TODO: Funções

void funcoes() {
  // Function f1 = (int x) => x * 2;
  // print(f1.runtimeType);
  // print(f1(30));

  

  // void f2(Function f) {
  //   f();
  // }

  // f2(f3);
  Function f3 = () => print('F3 executou!');

  final button = Button(
    label: 'SALVAR', 
    callBack: f3);

    button.onClick();
}

class Button {
  String? label;
  Function? callBack;

  Button({required this.label, 
  required this.callBack,
  });

  void onClick() {
    callBack!();
  }
}
