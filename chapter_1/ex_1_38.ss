(load "cont_frac.ss")

(define (d i)
  (if (= (remainder i 3) 2) (- i (/ (- i 2) 3))
      1))

(define e (+ (cont-frac-iter (lambda (i) 1.0)
                            d
                            10) 2))
(display e)
