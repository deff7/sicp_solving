(load "fixed_point.ss")

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
