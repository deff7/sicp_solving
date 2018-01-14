(define (f-recursive n)
  (if (< n 3)
    n
    (+ (f-recursive (- n 1))
       (f-recursive (- n 2))
       (f-recursive (- n 3)))
    ))

(f-recursive 1)
(f-recursive 3)
(f-recursive 5)

(define (f-iterative n)
  (define (f-iter a b c counter)
    (if (= counter 0)
      a
      (f-iter b c (+ a b c) (- counter 1))))
  (f-iter 0 1 2 n))

(f-iterative 1)
(f-iterative 3)
(f-iterative 5)
