import 'dart:io';

abstract class CajeroAutomatico {}

class Clientes extends CajeroAutomatico {
  static List<Map<String, dynamic>> datosClientesExistentes = [
    {
      "nombre": "Juan",
      "apellido": "Perez",
      "No. Cuenta": 5456846516,
      "usuario": "juanPerez",
      "cedula": "1234567890",
      "direccion": "Calle 1",
      "telefono": "0987654321",
      "correo": "juanPerez41@gmail.com",
      "contrasenia": 1432,
      "saldo": 1000.50
    },
    {
      "nombre": "Maria",
      "apellido": "Gonzalez",
      "No. Cuenta": 5476515456,
      "usuario": "mariaGonzalez",
      "cedula": "0987654321",
      "direccion": "Calle 2",
      "telefono": "1234567890",
      "correo": "mariaGonzales@gmail.com",
      "contrasenia": 5678,
      "saldo": 2000.00
    },
    {
      "nombre": "Pedro",
      "apellido": "Ramirez",
      "No. Cuenta": 5435789565,
      "usuario": "pedroRamirez",
      "cedula": "5678901234",
      "direccion": "Calle 3",
      "telefono": "6789012345",
      "correo": "pedroRamirez42@gmail.com",
      "contrasenia": 5423,
      "saldo": 3000.00
    }
  ];

  Clientes(List<Map<String, dynamic>> datosClientesExistentes);

  void mostrarClientes(String cedula) {
    bool encontrado = false;

    for (var datos in datosClientesExistentes) {
      if (datos['cedula'] == cedula) {
        print(datos);
        encontrado = true;
        break;
      }
    }

    if (!encontrado) {
      print('Cliente no Encontrado');
    }
  }

  bool usuersLogin(String usuario) {
    for (var datos in datosClientesExistentes) {
      if (datos['usuario'] == usuario) {
        return true;
      }
    }
    return false;
  }

  bool passwordLogin(int pin) {
    for (var datos in datosClientesExistentes) {
      if (datos['contrasenia'] == pin) {
        return true;
      }
    }
    return false;
  }

  bool login(String usuario, int pin) {
    var usuers = usuersLogin(usuario);
    var password = passwordLogin(pin);

    if (password == true && usuers == true) {
      print('si');
      return true;
    } else {
      print('no');
      return false;
    }
  }

  void cambiarPin(int pin) {
    for (var datos in datosClientesExistentes) {
      if (datos['contrasenia'] == pin) {
        print('Ingrese su nuevo pin: ');
        int nuevoPin = int.parse(stdin.readLineSync()!);
        print('Confirme su nuevo pin: ');
        int confirmarPin = int.parse(stdin.readLineSync()!);
        if (nuevoPin == confirmarPin) {
          datos['contrasenia'] = nuevoPin;
          print('Pin cambiado exitosamente');
        } else {
          print('Los pin no coinciden');
        }
        break;
      }
    }
  }
}
