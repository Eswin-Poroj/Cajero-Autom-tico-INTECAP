abstract class CajeroAutomatico {}

class Clientes extends CajeroAutomatico {
  dynamic datosClientesExistentes = [
    {
      "nombre": "Juan",
      "apellido": "Perez",
      "cedula": "1234567890",
      "direccion": "Calle 1",
      "telefono": "0987654321",
      "correo": "juanPerez41@gmail.com",
      "contrasena": "1432",
      "saldo": "1000"
    },
    {
      "nombre": "Maria",
      "apellido": "Gonzalez",
      "cedula": "0987654321",
      "direccion": "Calle 2",
      "telefono": "1234567890",
      "correo": "mariaGonzales@gmail.com",
      "contrasena": "5678",
      "saldo": "2000"
    },
    {
      "nombre": "Pedro",
      "apellido": "Ramirez",
      "cedula": "5678901234",
      "direccion": "Calle 3",
      "telefono": "6789012345",
      "correo": "pedroRamirez42@gmail.com",
      "contraseña": "5423",
      "saldo": "3000"
    }
  ];

  Clientes(this.datosClientesExistentes);

  void agregarCliente(Map<String, dynamic> cliente) {
    datosClientesExistentes.add(cliente);
    print('Cliente Agregado con Exito');
  }

  void eliminarCliente(String cedula) {
    datosClientesExistentes
        .removeWhere((element) => element['cedula'] == cedula);
    print('Cliente Eliminado con Exito');
  }

  void mostrarDatosClientes(String cedula) {
    datosClientesExistentes.forEach((element) {
      if (element['cedula'] == cedula) {
        print(element);
      }
    });
  }
}
