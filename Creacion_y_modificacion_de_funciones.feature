Feature: Creación y modificación de funciones
    COMO propietario de un cineclub QUIERO tener la capacidad de modificar la información de funciones y horarios de proyección PARA mantener a los cinéfilos informados sobre la programación actualizada.

  Scenario: Modificación de Horario de Proyección
    Given soy el propietario del cineclub y estoy autenticado en la aplicación web.
    When accedo a la sección de "Programación" y selecciono una función existente.
    Then el sistema me muestra los detalles de la función, incluido el horario de proyección

  Scenario: Cambio de Horario de Proyección
    Given estoy viendo los detalles de una función.
    When ajusto el horario de proyección y confirmo los cambios.
    Then el sistema actualiza el horario en la base de datos y me muestra un mensaje de confirmación.

  Scenario: Actualización de Información de Película
    Given estoy viendo los detalles de una función.
    When modifico los detalles de la película, como el título, género, director, etc.
    Then el sistema actualiza la información en la base de datos y muestra un mensaje de confirmación.

  Scenario: Cambio de Sala de Proyección
    Given estoy viendo los detalles de una función.
    When selecciono una sala de proyección diferente para la función.
    Then el sistema actualiza la asignación de sala en la base de datos y me muestra un mensaje de confirmación.

  Scenario: Agregar Nueva Función
    Given soy el propietario del cineclub y estoy autenticado en la aplicación web.
    When accedo a la sección de "Programación" y elijo "Agregar Nueva Función".
    Then el sistema me permite ingresar los detalles de la película y el horario de proyección.

  Scenario: Cancelar Modificaciones
    Given estoy viendo los detalles de una función y realizando cambios.
    When decido cancelar los cambios en cualquier momento antes de confirmar.
    Then el sistema me muestra un mensaje de confirmación para asegurarse de que deseo cancelar y no se aplican las modificaciones.

  Scenario: Horario en Conflicto
    Given que estoy modificando el horario de proyección de una función
    And el nuevo horario coincide con otro evento o función en la misma sala.
    Then el sistema me muestra un mensaje de error indicando que el horario está en conflicto y sugiere elegir otro horario.

  Scenario: Error en la Actualización
    Given estoy realizando cambios en los detalles de una función.
    When ocurre un error en la actualización de la base de datos debido a problemas técnicos.
    Then el sistema muestra un mensaje de error y recomienda intentarlo nuevamente o ponerse en contacto con el soporte técnico.
