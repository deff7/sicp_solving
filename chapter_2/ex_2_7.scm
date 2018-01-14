(load "interval.scm")

(print-interval (make-interval -1 1))
(sum-interval (make-interval -1 1)
              (make-interval 0 1))
