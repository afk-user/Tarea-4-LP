#lang scheme

;; itera sobre una receta para ver si se encuentra un ingrediente específico
;; retorna true si lo encuentra, false de otro modo
;;
;; ingrediente : el ingrediente a buscar
;; receta : la receta en donde se busca el ingrediente
(define (buscar_ingrediente ingrediente receta)
  (if (or (null? receta) (null? ingrediente))
      false
      (if (eqv? (car ingrediente) (car receta))
          true
          (buscar_ingrediente ingrediente (cdr receta)))))

;; Se itera sobre una lista de recetas y se devuelven solo las recetas que contienen cierto ingrediente
;;
;; ingrediente : el ingrediente a buscar
;; lista : la lista de recetas para extraer solo las que contienen el ingrediente
(define (buscar_recetas ingrediente lista)
  (if (null? lista)
      '()
      (if (buscar_ingrediente ingrediente (car lista))
                (cons (car (car lista)) (buscar_recetas ingrediente (cdr lista)))
                (buscar_recetas ingrediente (cdr lista)))))