(load "rational.scm")

(define (println s)
  (newline)
  (display s))

(define (exactly-equal? a b)
  (and (= (numer a) (numer b)) (= (denom a) (denom b))))

(define (assert a b)
  (cond 
    ((exactly-equal? a b) (println "Exactly equal"))
    ((rat-equal? a b) (println "Equal with coercion"))
    (else
    ((display "fail: ")
     (print-rat a)
     (display "not equals")
     (print-rat b)))))

(assert (make-rat -3 6) (make-rat -1 2))
(assert (make-rat 1 -2) (make-rat -1 2))

