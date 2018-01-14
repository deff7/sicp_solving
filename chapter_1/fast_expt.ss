(define (even? x) (= (remainder x 2) 0))

(define (fast-expt a n)
  (cond 
    ((= n 0) 1)
    ((even? n) (square (fast-expt a (/ n 2))))
    (else (* a (fast-expt a (- n 1))))))

(fast-expt 3 4)
(fast-expt 2 9)

(define (expt-iter b a n) 
  (cond
    ((= n 0) a)
    ((even? n) (expt-iter (square b) a (/ n 2)))
    (else (expt-iter b (* a b) (- n 1)))))
  

(define (expt b n)
  (expt-iter b 1 n))

(expt 3 4)
(expt 2 9)

