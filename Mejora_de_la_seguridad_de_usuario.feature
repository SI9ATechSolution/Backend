Feature: Mejora de la seguridad de usuario
    COMO cinéfilo/propietario QUIERO tener mayor seguridad en mis datos generales almacenados en la aplicación PARA evitar filtraciones no deseadas.

  Scenario: Envío de datos de registro sin errores al servidor
    Given el cinéfilo/propietario se encuentra en el registro
    When envíe los datos de registro al servidor
    Then el servidor encripta la contraseña, verifica que el usuario sea único
    And retorna un mensaje satisfactorio de registro.

  Scenario: Envío de datos de registro con errores al servidor
    Given el cinéfilo/propietario se encuentra en el registro
    When envíe los datos de registro al servidor
    Then el servidor retorna un mensaje de error durante el registro.

  Scenario: Obtención de llave de inicio de sesión satisfactorio
    Given el cinéfilo/propietario se encuentra en el inicio de sesión
    When envíe su [“correo electrónico”, “contraseña”] al servidor
    Then este devuelve un token que admite la información del usuario como válida.

  Scenario: Obtención de llave de inicio de sesión erróneo
    Given el cinéfilo/propietario se encuentra en el inicio de sesión
    When envíe su [“correo electrónico”, “contraseña”] al servidor
    And sean erróneos
    Then se deniega el acceso al usuario a la aplicación.
