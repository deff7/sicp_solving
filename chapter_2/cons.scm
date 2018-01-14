(define (cons a b)
  (lambda (first)
    (if first
      a
      b)))

(define (car c)
  (c true))

(define (cdr c)
  (c false))
