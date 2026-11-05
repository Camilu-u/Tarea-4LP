#lang scheme
;;Función llamada hash-coordenada, que recibe un parámetro:
;;Token: una cadena de texto que queremos procesar.
(define(hash-coordenada token)
;;Convierte el texto en una lista y conserva solo letras y números.
    (define caracteres 
        (filter
        (lambda (c)
        (or (char-alphabetic? c)
            (char-numeric? c)))
        (string->list token)))
    ;;Convierte cada carácter de la lista en su código numérico
    (define codigos
        (map char->integer caracteres))
    ;;Recorre los códigos acumulando un resultado
    (foldl
    ;;Recibe el código actual y el resultado acumulado.
    (lambda (codigo acumulador)
        ;;Comprueba si el codigo corresponde a un digito(48 a 57)
        (if(and(>= codigo 48)
                (<= codigo 57))
            ;;Si es un dígito, multiplica.
            ( * acumulador codigo)
            ;;Si es una letra, suma
            (+ acumulador codigo)))
    ;;El acumulador comienza en 0
    0
    ;;lista de codigos que se procesará
    codigos))