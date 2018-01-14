(load "helper.ss")
(load "cont_frac.ss")

(define (tan-cf x k)
  (cont-frac
    (lambda (i) (if (= i 1) x (- (* x x))))
    (lambda (i) (+ (* 2 (- i 1)) 1))
    k))

(find-appropriate-precision (tan 5.0) (lambda (k) (tan-cf 5.0 k)) 1 0.0001)
