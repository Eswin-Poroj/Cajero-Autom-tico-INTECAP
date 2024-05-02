import 'dart:io';
import 'persona.dart';

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

  dynamic transferir(int pin) {
    stdout.writeln('Ingrese el número de cuenta a quién le desea transferir: ');
    int noCuenta = int.parse(stdin.readLineSync()!);

    late double cantidadRetirar;
    var cuentaEncontrada = pedirCuentaTransferir(noCuenta);

    if (cuentaEncontrada == noCuenta) {
      stdout.writeln('1. Q 100              2. Q 200');
      stdout.writeln('3. Q 300              4. Q 500');
      stdout.writeln('5. Q 1000             6. Monto Variable');
      int opcion = int.parse(stdin.readLineSync()!);
      for (var datos in Clientes.datosClientesExistentes) {
        if (datos['No. Cuenta'] == cuentaEncontrada) {
          switch (opcion) {
            case 1:
              if (datos['saldo'] < 100) {
                print('Saldo Isuficiente');
              } else {
                datos['saldo'] += 100;
                cantidadRetirar = 100;
                print('Transferencia exitosa');
              }
              break;
            case 2:
              if (datos['saldo'] < 200) {
                print('Saldo Isuficiente');
              } else {
                datos['saldo'] += 200;
                cantidadRetirar = 200;
                print('Transferencia exitosa');
              }
              break;
            case 3:
              if (datos['saldo'] < 300) {
                print('Saldo Isuficiente');
              } else {
                datos['saldo'] += 300;
                cantidadRetirar = 300;
                print('Transferencia exitosa');
              }
              break;
            case 4:
              if (datos['saldo'] < 500) {
                print('Saldo Isuficiente');
              } else {
                datos['saldo'] += 500;
                cantidadRetirar = 500;
                print('Transferencia exitosa');
              }
              break;
            case 5:
              if (datos['saldo'] < 1000) {
                print('Saldo Isuficiente');
              } else {
                datos['saldo'] += 1000;
                cantidadRetirar = 1000;
                print('Transferencia exitosa');
              }
              break;

            case 6:
              stdout.writeln('Ingrese la cantidad a retirar: ');
              double cantidad = double.parse(stdin.readLineSync()!);
              if (datos['saldo'] < cantidad) {
                print('Saldo Isuficiente');
              } else {
                datos['saldo'] += cantidad;
                cantidadRetirar = cantidad;
                print('Transferencia exitosa');
              }

              break;
            default:
              print('Seleccione una opcción correcta');
          }
        }
      }
    } else {
      print('Cuenta no encotrada');
    }
    for (var datos in Clientes.datosClientesExistentes) {
      if (datos['contrasenia'] == pin) {
        datos['saldo'] -= cantidadRetirar;
      }
    }
  }
}

class Retirar extends CajeroAutomatico {
  void retirarEfectivo(int pin) {
    for (var datos in Clientes.datosClientesExistentes) {
      if (datos['contrasenia'] == pin) {
        stdout.writeln('1. Q 100              2. Q 200');
        stdout.writeln('3. Q 300              4. Q 500');
        stdout.writeln('5. Q 1000             6. Monto Variable');
        int opcion = int.parse(stdin.readLineSync()!);
        switch (opcion) {
          case 1:
            if (datos['saldo'] < 100) {
              print('Saldo Isuficiente');
            } else {
              datos['saldo'] -= 100;
              print('Retire su dinero');
            }
            break;
          case 2:
            if (datos['saldo'] < 200) {
              print('Saldo Isuficiente');
            } else {
              datos['saldo'] -= 200;
              print('Retire su dinero');
            }
            break;
          case 3:
            if (datos['saldo'] < 300) {
              print('Saldo Isuficiente');
            } else {
              datos['saldo'] -= 300;
              print('Retire su dinero');
            }
            break;
          case 4:
            if (datos['saldo'] < 500) {
              print('Saldo Isuficiente');
            } else {
              datos['saldo'] -= 500;
              print('Retire su dinero');
            }
            break;
          case 5:
            if (datos['saldo'] < 1000) {
              print('Saldo Isuficiente');
            } else {
              datos['saldo'] -= 1000;
              print('Retire su dinero');
            }
            break;

          case 6:
            stdout.writeln('Ingrese la cantidad a retirar: ');
            double cantidad = double.parse(stdin.readLineSync()!);
            if (datos['saldo'] < cantidad) {
              print('Saldo Isuficiente');
            } else {
              datos['saldo'] -= cantidad;
              print('Retire su dinero');
            }
          default:
            print('Seleccione una opcción correcta');
        }
      }
    }
  }
}
