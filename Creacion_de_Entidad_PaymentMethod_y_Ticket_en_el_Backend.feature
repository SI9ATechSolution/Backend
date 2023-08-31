Feature: Creación de Entidad PaymentMethod y Ticket en el Backend
    COMO desarrollador del backend QUIERO agregar la entidad PaymentMethod y Ticket en el backend PARA permitir a los usuarios cinéfilos seleccionar métodos de pago y generar tickets de compra de entradas.

  Scenario: Definición de la Entidad PaymentMethod
    Given estoy trabajando en el desarrollo del sistema.
    When agrego la entidad PaymentMethod al modelo de datos en el backend, con atributos como id, token y user_id.
    Then la entidad PaymentMethod queda correctamente definida en el sistema.

  Scenario: Integración de PaymentMethod con la Lógica de Compra
    Given he implementado la entidad PaymentMethod en el backend.
    When adapto la lógica de compra de entradas para incluir la selección de métodos de pago.
    Then los usuarios pueden elegir entre los métodos de pago disponibles durante el proceso de compra.

  Scenario: Creación de la Entidad Ticket
    Given quiero mejorar la experiencia de los usuarios cinéfilos.
    When desarrollo la entidad Ticket en el backend para representar los detalles de la compra de entradas, como precio, showtime, asientos y payment token.
    Then el sistema es capaz de generar y almacenar un Ticket único para cada compra de entradas.

  Scenario: Generación de Tickets al Completar la Compra
    Given los usuarios cinéfilos han seleccionado sus asientos y método de pago.
    When la transacción de compra es exitosa y se registra en el backend.
    Then el sistema genera automáticamente un Ticket correspondiente a la compra y lo asocia a la transacción.

  Scenario: Validación de Datos de Métodos de Pago
    Given los usuarios están seleccionando métodos de pago. Si los métodos de pago seleccionados no cumplen con los requisitos definidos, como tarjetas de crédito inválidas.
    When los métodos de pago seleccionados no cumplen con los requisitos definidos, como tarjetas de crédito inválidas.
    Then implemento la validación de datos en el backend para asegurar que los métodos de pago sean válidos antes de continuar con la compra.

  Scenario: Error en la Generación de Tickets
    Given se ha realizado una compra de entradas.
    When ocurre un error en la generación del Ticket debido a problemas técnicos o de datos.
    Then implemento manejo de excepciones y mensajes de error para que los usuarios cinéfilos sean notificados adecuadamente y se pueda resolver el problema.
