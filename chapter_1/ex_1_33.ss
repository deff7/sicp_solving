(load "helper.ss")
(load "smallest_divisor.ss")
(load "gcd.ss")

(define (filtered-accumulate filt comb null term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (if (filt a)
        (iter (next a) (comb result (term a)))
        (iter (next a) result))))
  (iter a null))

(define (sum-of-primes a b)
  (filtered-accumulate prime? + 0 identity a inc b))

(sum-of-primes 0 11)

(define (product-prime n)
  (define (relative-prime x) (= (gcd n x) 1))
  (filtered-accumulate relative-prime * 1 identity 1 inc n))

(product-prime 6)
