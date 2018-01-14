(load "helper.ss")

(define (accumulate combine null-value term a next b)
  (if (> a b)
    null-value
    (combine (term a) (accumulate combine null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(sum identity 0 inc 10)
(product identity 1 inc 5)
