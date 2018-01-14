(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (cycle-div c d res)
  (if (= (remainder c d) 0)
    (cycle-div (/ c d) d (+ res 1))
    res))

(define (car c)
  (cycle-div c 2 0))

(define (cdr c)
  (cycle-div c 3 0))

;;; Test it!

(define c (cons 6 7))
(car c)
(cdr c)
