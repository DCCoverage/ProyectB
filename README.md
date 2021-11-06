# Proyecto B Testing: DCCinema

_DCCoverage (G17)_

## Modelos

* Sala:
  * Número
* Pelicula:
  * Nombre
  * Imagen
* Función:
  * PeliculaId
  * SalaId
  * Día (?)
  * Horario
* Reserva:
  * FuncionId
  * Fila
  * Asiento

## Restricciones
* Una sala no transmite 2 peliculas al mismo tiempo
* Una pelicula se puede mostrar en más de una sala al mismo tiempo
* Se puede crear una pelicula solo si hay funciones disponibles
* No se puede reservar el mismo asiento 2 veces para una función
* Se deben poder reservar múltiples asientos de una misma fila