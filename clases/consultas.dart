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
        return datos['No. Cuenta'];
      }
    }
    if (!encontrada) {
      return false;
    }
  }

  dynamic transferir() {
    stdout.writeln('Ingrese el número de cuenta a quién le desea transferir: ');
    int noCuenta = int.parse(stdin.readLineSync()!);
    var cuentaEncontrada = pedirCuentaTransferir(noCuenta);

    if (cuentaEncontrada == noCuenta) {
      stdout.writeln('Ingrese la cantidad a transferir: ');
      double cantidad = double.parse(stdin.readLineSync()!);
      for (var datos in Clientes.datosClientesExistentes) {
        if (datos['No. Cuenta'] == cuentaEncontrada) {
          if (datos['saldo'] < cantidad) {
            print('Saldo insuficiente');
            break;
          } else {
            datos['saldo'] += cantidad;
            print('Transferencia exitosa');
            break;
          }
        }
      }
    } else {
      print('Cuenta no encotrada');
    }
  }
}

class Retirar extends CajeroAutomatico {}
