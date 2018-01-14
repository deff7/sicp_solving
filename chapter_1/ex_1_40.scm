(load "newton.scm")

(define (cubic a b c)
  (lambda (x) (+ (* x (+ b (* x (+ a x)))) c)))

(define (solve-cubic a b c)
  (newton-method (cubic a b c) 1.0))

(solve-cubic 0 0 -8)
