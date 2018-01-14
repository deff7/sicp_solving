(define (add a b) (+ a b))
(define (double a) (+ a a))
(define (halve a) (/ a 2))
(define (even? a) (= (remainder a 2) 0))

(define (mult a b product)
  (cond
    ((= b 0) product)
    ((even? b) (mult (double a) (halve b) product))
    (else (mult a (- b 1) (add product a)))))

(define (* a b)
  (mult a b 0))

(define (fast-expt-iter a b n)
  (cond 
    ((= n 0) a)
    ((even? n) (fast-expt-iter a (square b) (/ n 2)))
    (else (fast-expt-iter (* a b) b (- n 1)))))

(define (fast-expt b n)
  (fast-expt-iter 1 b n))

(fast-expt 2 2)

