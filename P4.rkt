#lang scheme

(define (buscar_ingrediente ingrediente receta)
  (if (or (null? receta) (null? ingrediente))
      false
      (if (eqv? (car ingrediente) (car receta))
          true
          (buscar_ingrediente ingrediente (cdr receta)))))

(define (buscar_recetas ingrediente lista)
  (if (null? lista)
      '()
      (if (buscar_ingrediente ingrediente (car lista))
                (cons (car (car lista)) (buscar_recetas ingrediente (cdr lista)))
                (buscar_recetas ingrediente (cdr lista)))))