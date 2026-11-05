#lang scheme 
;; Función llamada limpiar-simple.
;; Recibe dos parametros: filtro:función que se realizará a los números y frecuencias: lista de números que queremos procesar.
(define (limpiar-simple filtro frecuencias) 

;; Caso en que la lista está vacía, devuelve una lista vacia
    (if(null? frecuencias)
        '()
;; Aplica la operación filtro al primer número de la lista, mediante car. y coloca el resultado al comienzo de la lista que se esta construyendo.
        (cons (filtro (car frecuencias))
;; La función vuelve a llamarse con el resto de la lista.
        (limpiar-simple filtro(cdr frecuencias)))))
;; Función llamada limpiar-cola
;; Recibe 2 parámetros: filtro: función que se realizara a los números, frecuencias: lista de números.
(define (limpiar-cola filtro frecuencias)
;;Función auxiliar para la recursión.
;; Recibe 2 parámetros: restantes: lista de números que faltan por procesar, y acumulador: lista donde se guarda los resultados.
    (define(auxiliar restantes acumulador)
;; Caso donde preguntamos si la lista está vacía = se procesaron todos los números si es así se devuleve el acumulador.
;; Usamos reverse para recuperar el orden original.
        (if(null? restantes)
            (reverse acumulador)
            (auxiliar
                ;;Obtiene el resto de la lista    
                (cdr restantes)
                ;;Obtiene el primer número y le aplica filtro.
                ;; Y agrega en número ya procesado al principio de acumulador.
                (cons (filtro (car restantes)) acumulador))))
    ;; Inicia la recursion con la lista completa y un acumulador vacio
    (auxiliar frecuencias '()))


