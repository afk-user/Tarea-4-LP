#lang scheme
(define haga-cola
  (lambda ()
    (let ((q '()))
      (lambda (op . args)
        (cond
          ((eqv? op 'vacio?)(null? q))
          ((eqv? op 'push!) (begin (set! q (append q args))) q)
          ((eqv? op 'pop!) (begin (set! q (cdr q))) q)
          ((eqv? op 'tope!) (car q))
          (else "operacion no valida"))))))

(define bfs
  (lambda (arbol)
    (define queue (haga-cola))
    (let treevel ((a arbol) (q queue) (r '()))
      (q 'push! a)
      (letrec ((loop (lambda (tree queue answer)
                       (if (queue 'vacio?)
                           r
                           (begin
                             (if (null? (queue 'tope!))
                                 '() ;; si no funciona sin contar vacios, poner append (list '())
                                 (set! r (append r (list(car (queue 'tope!))))))
                             (if (null? (queue 'tope!))
                                 '()
                                 (queue 'push! (cadr (queue 'tope!))))
                             (if (null? (queue 'tope!))
                                 '()
                                 (queue 'push! (caddr (queue 'tope!))))
                             (queue 'pop!)
                             (loop tree queue answer))))))
        (loop a q r)))))

(bfs '(a(b()())(c()())))
(bfs '(cocina (arriba (alacena (gabinete () (vaso () ())) (vaso () ())) (estante (tenedor () ()) (batidor () ()))) (abajo (taburete (vaso () ()) ()) (cajon (batidor () ()) (tenedor () ())))))