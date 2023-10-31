#lang scheme

;; Estructura de dato: Cola para hacer el bfs
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

;; Busqueda a lo ancho para transformar un arbol binario a una lista
;;
;; arbol : arbol a transformar
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
                                 (set! r (append r (list '())));; si no funciona sin contar vacios, poner append (list '())
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

;; Parecida a la función buscar_ingrediente, se itera sobre una lista para encontrar la primera aparición de un item en específico
;; devuelve la posición del item si lo encuentra, y devuelve false si no lo encuentra
;;
;; item : item a buscar
;; lista : lista en la que se busca el item
(define (buscar item lista)
  (let search ((i item) (l lista) (n 1))
    (if (or (null? i) (null? l))
        false
        (if (eqv? (car i) (car l))
            n
            (search i (cdr l) (+ 1 n))))))

;; Dado un arbol binario, se busca un utensilio en este por medio de bfs
;; retorna el camino más corto al utensilio en caso de encontrarlo, retorna "no está" si no se encuentra
;;
;; utensilio : utensilio que se busca en la cocina
;; arbol : arbol que se entrega para buscar el utensilio
(define (buscar_utensilio utensilio arbol)
  (let assist ((lista (bfs arbol)) (path '()))
    (let iterate ((closest (buscar utensilio lista)) (p path))
      (cond ((not closest) '())
            ((= closest 1) (set! path (cons closest p)))
            ((even? closest)
             (iterate (/ closest 2) (cons closest p)))
            ((not (even? closest))
             (iterate (/ (- closest 1) 2) (cons closest p)))))
    (if (null? path) "no está"
        (begin (reverse (cdr (reverse path)))
               (let seek_path ((p path) (new '()))
                 (if (null? p) (reverse (cdr new))
                     (seek_path (cdr p) (cons (list-ref lista (-(car p) 1)) new))))))))