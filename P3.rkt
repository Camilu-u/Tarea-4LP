#lang scheme
;;Función llamada fase-alfa que recibe un parametro.
;;Senal: una lista de números que queremos procesar
(define(fase-alfa senal)
    ;;comprobamos si lista senal está vacía
    ;;Si está vacía, devolvemos una lista vacía y termina la recursión.
    ;;Si no está vacía, continuamos procesando sus elementos.
    (if (null? senal)
        '()
        ;;Se obtiene el primer número, y se le suma 10. Y se construye una nueva lista colocando ese resultado al inicio.
        (cons(+ (car senal) 10)
            ;;Se entrega el resto de la lista a fase-beta,
            ;;para continuar el procesamiento mediante recursión mutua.
            (fase-beta (cdr senal)))))
;;Función llamada fase-beta, que recibe un parámetro: senal: lista de números
(define(fase-beta senal)
    ;;comprobamos si la lista esta vacia, si lo esta se devuelve una lista vacía
    (if(null? senal)
    '()
    ;;Se obtiene el primer número y luego se multiplica por 2, y se agrega el resultado a la nueva lista.
    (cons (* (car senal)2)
            ;;Entrega los elementos restantes a fase-alfa.
            ;;Continuando así la recursion mutua.
            (fase-alfa(cdr senal)))))