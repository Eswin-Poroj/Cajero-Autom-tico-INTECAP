import 'dart:io';
import 'persona.dart';

abstract class Operaciones {
  void buscar();
  void pedirCuentaTransferir();
  void retirar();
}

class Consulta extends CajeroAutomatico {
  void buscar(int pin) {
    for (var datos in Clientes.datosClientesExistentes) {
      if (datos['contrasenia'] == pin) {
        print('El saldo de su cuenta es: ${datos['saldo']}');
      }
    }
  }
}

class Transferir extends CajeroAutomatico {
  dynamic pedirCuentaTransferir(int noCuenta) {
    bool encontrada = false;
    for (var datos in Clientes.datosClientesExistentes) {
      if (datos['No. Cuenta'] == noCuenta) {
        encontrada = true;
        return noCuenta;
      }

      if (!encontrada) {
        print('Cuenta no encontrada');
      }
    }
  }

  dynamic retirar(int pin) {
    stdout.writeln('Ingrese el número de cuenta a quién le desea transferir: ');
    int noCuenta = int.parse(stdin.readLineSync()!);
    bool encontrada = pedirCuentaTransferir(noCuenta);
    if (!encontrada) {
      for (var datos in Clientes.datosClientesExistentes) {
        if (datos['contrasenia'] == pin) {
          print('Ingrese la cantidad a transferir: ');
          double cantidad = double.parse(stdin.readLineSync()!);
          if (datos['saldo'] >= cantidad) {
            datos['saldo'] -= cantidad;
            print('Transferencia exitosa');
          } else {
            print('Saldo insuficiente');
          }
        }
      }
    }
  }
}
