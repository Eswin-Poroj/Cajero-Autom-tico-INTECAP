import "persona.dart";

abstract class Auntenticar {}

class Login implements CajeroAutomatico {
  bool usuersLogin(String usuario) {
    for (var datos in Clientes.datosClientesExistentes) {
      if (datos['usuario'] == usuario) {
        return true;
      }
    }
    return false;
  }

  bool passwordLogin(int pin) {
    for (var datos in Clientes.datosClientesExistentes) {
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
      return true;
    } else {
      return false;
    }
  }
  //Get de la clase Persona
}
