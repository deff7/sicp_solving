(load "segment.scm")

(define segm (make-segment (make-point 0 2) (make-point 4 0)))

(print-point (midpoint-segment segm))
