#lang scheme

;; Calcula las funciones entregadas y las almacena y retorna en una lista nueva
;;
;; base : número base sobre el cual se evaluan las funciones
;; lista : lista de funciones a evaluar
(define cantidades_cola
  (lambda (base lista)
    (let cant ((b base) (l lista) (r '()))
                        (if (null? l)
                            r
                            (cant b (cdr l) (append r (list((car l) b))))))))

;; Calcula las funciones entregadas y las reemplaza a medida que las soluciona
;;
;; base : número base sobre el cual se evaluan las funciones
;; lista : lista de funciones a evaluar
(define (cantidades_simple base lista)
  (if (null? lista)
      '()
      (cons ((car lista) base) (cantidades_simple base (cdr lista)))))