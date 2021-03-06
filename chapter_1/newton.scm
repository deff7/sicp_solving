(load "helper.ss")
(load "fixed_point.ss")

(define dx 0.00001)

(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))

(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))

(define (newton-method f start)
  (fixed-point (newton-transform f) start))

(define (sqrt x)
  (newton-method (lambda (y) (- (square y) x)) 1.0))
