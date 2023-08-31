Feature: Mejora de Promotion, Showtime y creación de AvailableFilm
    COMO miembro del equipo de desarrollo que trabaja en el backend de la aplicación TuCine QUIERO mejorar las entidades Promotion y Showtime, y agregar la entidad AvailableFilm PARA evidenciar una mejora en la funcionalidad del backend.

  Scenario: Mejora de Promotion
    Given me encuentro en el backend
    When mejoro los atributos y métodos
    Then el IDE guarda los cambios realizados

  Scenario: Mejora de Showtime
    Given me encuentro en el backend
    When agrego y modifico atributos y métodos
    Then el IDE guarda los cambios realizados.

  Scenario: Creación de AvailableFilm
    Given me encuentro en el backend
    When creo la entidad AvailableFilm, defino sus atributos y métodos, y la relaciono con otras entidades
    Then otras entidades pueden acceder a los atributos y métodos de la entidad AvailableFilm.

  Scenario: Ejecución exitosa del backend
    Given me encuentro en el backend
    When realizo las mejoras correspondientes sin errores Y ejecuto la aplicación
    And ejecuto la aplicación
    Then la aplicación TuCine se ejecuta sin problemas.

  Scenario: Errores detectados
    Given me encuentro en el backend
    When realizo las mejoras correspondientes
    And se detecta algún error
    Then el IDE muestra algunas soluciones a dichos errores.
