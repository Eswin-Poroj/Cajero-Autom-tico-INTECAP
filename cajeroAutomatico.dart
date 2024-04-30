import 'dart:io';

import 'clases/autenticarLogin.dart';
import 'clases/persona.dart';
import 'clases/consultas.dart';

var clientes = Clientes();

void main(List<String> args) {
  var autenticar = Login();
  print('CAJERO AUTOMATICO');
  stdout.writeln('Ingrese su usuario: ');
  String usuario = stdin.readLineSync()!;

  stdout.writeln('Ingrese su pin');
  int pin = int.parse(stdin.readLineSync()!);
  bool inicio = autenticar.login(usuario, pin);

  if (inicio == true) {
    menuPrincipal(usuario, pin);
  } else {
    print('Usuario o contraseña incorrecta');
  }
}

void menuPrincipal(String usuario, int pin) {
  for (var datos in Clientes.datosClientesExistentes) {
    if (datos['usuario'] == usuario && datos['contrasenia'] == pin) {
      print('Bienvenido ${datos['nombre']}');
      break;
    }
  }
  stdout.writeln('1. Transferencias        2. Retiros');
  stdout.writeln('3. Consultas             4. Transacciones');
  stdout.writeln('                 5. Salir');
  String opcion = stdin.readLineSync()!;
  switch (opcion) {
    case '1':
      Transferir().retirar(pin);
      break;
    case '2':
      break;
    case '3':
      var consultar = Consulta();
      consultar.buscar(pin);
    default:
      print('Seleccione una opcción correcta');
  }
}
