Feature: Redactar y enviar reseña para cineclub
    Comp cinéfilo quiero tener la posibilidad de redactar y publicar reseñas relacionadas con mi experiencia en un cineclub determinado para dar a conocer mi opinión al público

  Scenario: Cinéfilo ingresa al perfil de un cineclub para redactar reseña
    Given el cinéfilo se encuentre en el perfil de un cineclub determinado
    When presione la caja de comentarios ubicada en la sección “Reseñas y comentarios”
    Then podrá comenzar a redactar su opinión

  Scenario: Cinéfilo desea publicar reseña
    Given el cinéfilo presione el botón que confirma su intención de dejar un comentario en el perfil del cineclub
    When termine de redactar su opinión en la casilla designada
    And presione el botón “enviar”
    Then su mensaje será enviado al sistema

  Scenario: Cinéfilo intenta enviar reseña incompleta
    Given el cinéfilo no haya escrito un mensaje en la casilla designada para reseñas
    When presione el botón “enviar”
    Then se mostrará un mensaje de error solicitándole redactar un mensaje antes de enviar.

  Scenario: Problemas de carga
    Given el cinéfilo haya presionado el botón “enviar”
    When ocurra un error en el sistema que impida procesar su solicitud
    Then se mostrará un mensaje de error indicando que “No se puede enviar la reseña en este momento”
