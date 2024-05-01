import 'dart:io';

import 'clases/autenticarLogin.dart';
import 'clases/persona.dart';
import 'clases/consultas.dart';

var clientes = Clientes([]);

void main() {
  var autenticar = Login();
  var intentos = 0;
  do {
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
    intentos++;
  } while (intentos < 3);
  print('Ha superado el número de intentos permitidos');
  print(
      'Recuerde su usuario y contraseña o acérquese a la sucursal más cercana');
}

void menuPrincipal(String usuario, int pin) {
  String opcion = '';
  do {
    for (var datos in Clientes.datosClientesExistentes) {
      if (datos['usuario'] == usuario && datos['contrasenia'] == pin) {
        print('Bienvenido ${datos['nombre']}');
        break;
      }
    }
    stdout.writeln('1. Transferencias        2. Retiros');
    stdout.writeln('3. Consultas             4. Cambio de Pin');
    stdout.writeln('                 5. Salir');
    String opcion = stdin.readLineSync()!;
    switch (opcion) {
      case '1':
        var transferir = Transferir();
        transferir.transferir(pin);
        break;
      case '2':
        var retirar = Retirar();
        retirar.retirarEfectivo(pin);
        break;
      case '3':
        var consultar = Consulta();
        consultar.buscar(pin);
        break;
      case '4':
        var cambiarPin = Clientes([]);
        cambiarPin.cambiarPin(pin);
        break;
      case '5':
        print('Gracias por utilizar nuestros servicios');
        return main();
      default:
        print('Seleccione una opcción correcta');
    }
  } while (opcion != '5');
}
