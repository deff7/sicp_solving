(load "fixed_point.ss")
(load "ex_1_43.scm")

(define (average-damp f)
  (lambda (x) (/ (+ x (f x)) 2)))

(define (sqrtfn n x)
  (lambda (y) (/ x (expt y (- n 1)))))

(fixed-point ((repeated (lambda (g) (average-damp g)) 2) (sqrtfn 6 64)) 1.0)
