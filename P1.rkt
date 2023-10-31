#lang scheme

;; Función que itera sobre si misma para contar el largo de una lista
;;
;; lista : la lista que se recibe para contarle el largo
(define (largo lista)
  (if (null? lista)
      0
      (+ 1 (largo (cdr lista)))))

;; Revisa que el largo de una lista dada sea igual al supuesto valor dado
;;
;; cantidad : la cantidad con la que se corrobora el largo de una lista
;; lista : la lista que se recibe para contarle el largo
(define (checkear cantidad lista)
  (if (= cantidad (largo lista))
      (display "true")
      (display "false")))