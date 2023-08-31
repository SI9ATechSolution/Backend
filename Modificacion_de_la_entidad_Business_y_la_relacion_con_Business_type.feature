Feature: Modificación de la entidad Business y la relación con Business_type
    COMO Desarrollador
    QUIERO poder agregar Business_type a un Business existente,
    PARA categorizar y clasificar diferentes tipos de negocios.

  Scenario: Agregar Business_type a Business existente
    Given soy desarrollador
    And Y tengo un Business existente con el ID 123
    When envío una solicitud POST a /businesses/123/business_types con los datos del nuevo Business_type
    Then debería recibir una respuesta exitosa con código 201 (Created)

  Scenario: Consultar Business_types de un Business
    Given soy desarrollador
    And tengo un Business existente con el ID 123 al que previamente agregué Business_types
    When envío una solicitud GET a /businesses/123/business_types
    Then debería recibir una respuesta exitosa con código 200 (OK)
    And en la respuesta debería haber una lista de Business_types asociados al Business con ID 123

  Scenario: Consultar Business_types de un Business sin Business_types asociados
    Given soy un desarrollador
    And tengo un Business existente con el ID 456 que no tiene Business_types asociados
    When envío una solicitud GET a /businesses/456/business_types
    Then debería recibir una respuesta exitosa con código 200 (OK)
    And en la respuesta la lista de Business_types debería estar vacía

  Scenario: Intento agregar Business_type a un Business inexistente
    Given soy un desarrollador
    And no existe un Business con el ID 789
    When envío una solicitud POST a /businesses/789/business_types con los datos del nuevo Business_type
    Then debería recibir una respuesta de error con código 404 (Not Found)
