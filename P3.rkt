#lang scheme

(define (largo lista)
  (if (null? lista)
      0
      (+ 1 (largo (cdr lista)))))

(define checkear
  (lambda (x)
    (let check ((cantidad (car x)) (lista (car(cdr x))))
      (if (= cantidad 0)
          '()
          (if (= cantidad (largo lista))
              '()
              (list (list (- cantidad (largo lista)) (car lista))))))))

(define armar_lista
  (lambda (stock)
    (let tobuy ((s stock) (l '()))
      (if (null? s)
          l
          (tobuy (cdr s) (append l (checkear (car s))))))))