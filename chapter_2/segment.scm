(load "point.scm")

(define (make-segment a b)
  (cons a b))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

(define (average a b)
  (/ (+ a b)
     2))

(define (midpoint-segment s)
  (make-point 
    (average
      (x-point (start-segment s))
      (x-point (end-segment s)))
    (average
      (y-point (start-segment s))
      (y-point (end-segment s)))))
