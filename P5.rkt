#lang scheme
(define (viajarbol a)
  (if (null? a)
      '()
      (if (cons? a)
          (cons (viajarbol (car a))
                (viajarbol (cdr a)))
          a)))

(define (viajarbol2 a)
  (if (null? a)
      '()
      (if (cons? a)
          (cons (viajarbol (car a))
                (viajarbol (cdr a)))
          a)))

(define buscar_utensilio
  (lambda (utensilio arbol)
    (let treevel ((u utensilio) (a arbol))
      (if (null? a) '()
          (if (eqv? (car a) u)
              a;; guardar el path hasta el lugar
              (if (cons? a)
                  (cons (treevel u (car a))
                        (treevel u (cdr a)))
                  a))))))