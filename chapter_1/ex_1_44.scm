(load "ex_1_43.scm")

(define dx 0.00001)

(define (smooth f)
  (lambda (x) (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3)))

(define (n-fold-smoothed f n)
  ((repeated (lambda (g) (smooth g)) n) f))

(define (n-fold-smoothed-w f n)
  (repeated (smooth f) n))

((n-fold-smoothed square 2) 1.0)
((n-fold-smoothed-w square 2) 1.0)


