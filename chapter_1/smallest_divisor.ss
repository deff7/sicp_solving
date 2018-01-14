(load "helper.ss")

(define (smallest-divisor n next)
  (find-divisor 2 n next))

(define (find-divisor a n next)
  (cond ((> (square a) n) n)
        ((divides? n a) a)
        (else (find-divisor (next a) n next))))

(define (prime? x next) (= (smallest-divisor x next) x))

