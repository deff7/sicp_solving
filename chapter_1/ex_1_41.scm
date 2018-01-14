(load "helper.ss")

(define (double f)
  (lambda (x) (f (f x))))

((double inc) 0)
(((double (double double)) inc) 5)
