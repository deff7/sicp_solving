(define (binom depth n)
  (cond ((or (<= n 1) (>= n depth)) 1)
        (else (+ (binom (- depth 1) (- n 1))
                 (binom (- depth 1) n)))))

(binom 1 1)
(binom 3 2)
(binom 5 3)
