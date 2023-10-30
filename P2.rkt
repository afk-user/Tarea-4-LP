#lang scheme
(define cantidades_cola
  (lambda (base lista)
    (let cant ((b base) (l lista) (r '()))
                        (if (null? l)
                            r
                            (cant b (cdr l) (append r (list((car l) b))))))))

(define (cantidades_simple base lista)
  (if (null? lista)
      '()
      (cons ((car lista) base) (cantidades_simple base (cdr lista)))))