(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (x y) x)))

(define (cdr z)
  (z (lambda (x y) y)))

;;; Test it!

(car (cons 4 5))
(cdr (cons 4 5))
