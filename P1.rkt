#lang scheme
(define (largo lista)
  (if (null? lista)
      0
      (+ 1 (largo (cdr lista)))))

(define (checkear cantidad lista)
  (if (= cantidad (largo lista))
      (display "true")
      (display "false")))