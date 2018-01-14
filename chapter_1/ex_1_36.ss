(load "fixed_point.ss")

(fixed-point-log (lambda (x) (/ (log 1000) (log x))) 1.1)
(fixed-point-log (lambda (x) (/ (+ (/ (log 1000) (log x)) x) 2)) 1.1)
