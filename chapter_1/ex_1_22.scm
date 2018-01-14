(load "smallest_divisor.ss")

(define (search-for-primes prime-proc from count)
  (if (> count 0)
    (cond ((prime-proc from)
           (benchmark (lambda () (prime-proc from)))
           (search-for-primes prime-proc (+ from 1) (- count 1)))
          (else (search-for-primes prime-proc (+ from 1) count)))))

(define (prime-inc? x) (prime? x inc))

(define (next x) (if (= x 2) 3 (+ x 2)))
(define (prime-next? x) (prime? x next))

(define (expmod base exp m)
  (define (remainder-or-zero)
    (let ((sq (expmod base (/ exp 2) m)))
      (let ((rem (remainder (square sq) m)))
        (if (and (= rem 1) (not (= sq 1)) (not (= sq (- m 1))))
          0
          rem))))
  (cond ((= exp 0) 1)
        ((even? exp) (remainder-or-zero))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? x times)
  (cond ((= times 0) true)
        ((fermat-test x) (fast-prime? x (- times 1)))
        (else false)))

(define (fast-prime-a? x)
  (fast-prime? x 10))

(define (test-all n)
  (define (test a) (= (expmod a n n) a))
  (define (iter start)
    (cond ((= start n) true)
      ((test start) (iter (+ start 1)))
      (else false)))
  (iter 1))

(define (miller-rabin n)
  (define (iter a t)
    (define (try-it)
      (= (expmod a (- n 1) n) 1))
    (if (= a n)
      (> t (/ n 2))
      (if (try-it)
        (iter (+ a 1) (+ t 1))
        (iter (+ a 1) t))))
  (iter 1 0))

(miller-rabin 13)
(miller-rabin 125)
(miller-rabin 561)
