#lang scheme
;;Función llamada fabricar-decodificador, que recibe un parámetro:
;; codice: diccionario que contiene simbolos originales y sus traducciones.
(define (fabricar-decodificador codice)
    ;;Función interna que recibe dos parametros:
    ;; simbolo: símbolo que queremos traducir, y pares: lista de pares del diccionario donde buscaremos el símbolo.
  (define (buscar simbolo pares)
    (cond
    ;;comprobamos si la lista de pares esta vacía, si la lista esta vacia = no encontro el simbolo en el dicc.
      ((null? pares) simbolo)
      ;;Comprueba si el simbolo que buscamos coincide con el primero de par.
      ((equal? simbolo (car (car pares)))
      ;; Si coincide se devuelve su traduccion
       (cdr (car pares)))
       ;;Si el simbolo no coincide, la función vuelve a llamarse utilizando el resto del diccionario.
      (else
       (buscar simbolo (cdr pares)))))

;; Función decodificar
;;Recibe el mensaje completo como parametro.
  (define (decodificar mensaje)
  ;;Comprueba si el mensaje esta vacio, y devuelve una lista vacía cuando ya no quedan simbolos.
    (if (null? mensaje)
        '()
        ;;Traduce el mensaje, buscar traduce el primer símbolo, cons lo agrega a la nueva lista y la recursión continúa con el resto del mensaje.
        (cons (buscar (car mensaje) codice)
              (decodificar (cdr mensaje)))))
    ;; Devuelve una funcion lambda que conserva el codice.
  (lambda (mensaje)
    (decodificar mensaje)))