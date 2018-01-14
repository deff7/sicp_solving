(load "interval.scm")

(define i1 (make-interval -1 1))
(define i2 (make-interval 2 3))

(println (interval-radius i1))
(println (interval-radius i2))

(println (interval-radius (sum-interval i1 i2)))
(println (interval-radius (sub-interval i1 i2)))
(println (interval-radius (mul-interval i1 i1)))
(println (interval-radius (div-interval i1 i2)))
