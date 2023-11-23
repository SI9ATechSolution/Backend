Feature: Eliminar reseñas
    COMO cinéfilo autor de una reseña QUIERO tener la posibilidad de eliminar mi reseña publicada en la caja de comentarios de un cineclub PARA que esta no pueda ser visualizada por el público

  Scenario: Cinéfilo intenta elimina una reseña
    Given un cinéfilo desee eliminar una reseña que haya publicado anteriormente en el perfil de un cineclub
    When presione el botón “eliminar comentario”
    Then saltará un mensaje consultando al usuario si desea eliminar el comentario publicado

  Scenario: Cinéfino elimina reseña satisfactoriamente
    Given el cinéfilo haya presionado el botón “eliminar comentario” y haya sido mostrado el mensaje de confirmación
    When presione el botón “confirmar”
    Then se eliminará el comentario publicado

  Scenario: Problemas de carga
    Given el cinéfilo haya presionado el botón eliminar comentario
    When ocurra un error en el sistema que impida procesar su solicitud
    Then se mostrará un mensaje de error indicando que “No se puede eliminar la reseña en este momento”
