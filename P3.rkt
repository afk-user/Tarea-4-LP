#lang scheme

;; Como en P1, esta función itera sobre si misma para contar el largo de una lista
;;
;; lista : lista de la cual se contará el largo
(define (largo lista)
  (if (null? lista)
      0
      (+ 1 (largo (cdr lista)))))

;; Compara la cantidad necesaria de un ingrediente con la cantidad actual de tal ingrediente
;;
;; x : es la tupla donde (car x) es la cantidad necesaria y (cadr x) es una lista homogenea con la cantidad actual
(define checkear
  (lambda (x)
    (let check ((cantidad (car x)) (lista (cadr x)))
      (if (< cantidad 1)
          '()
          (if (< cantidad (+ 1 (largo lista)))
              '()
              (list (list (- cantidad (largo lista)) (car lista))))))))

;; La funcion retorna una lista de pares que indican cuanto hay que comprar de un ingrediente para alcanzar cantidad necesaria
;;
;; stock : conjunto de listas que contiene todas las tuplas cantidad necesaria/cantidad actual
(define armar_lista
  (lambda (stock)
    (let tobuy ((s stock) (l '()))
      (if (null? s)
          l
          (tobuy (cdr s) (append l (checkear (car s))))))))