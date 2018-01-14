(load "cont_frac.ss")
(load "fixed_point.ss")

(define (find-appropriate-precision proc k eps)
  (let ((golden-guess (/ 1
                         (proc (lambda (k) 1.0)
                                 (lambda (k) 1.0)
                                 k))))
    (newline)
    (display golden-guess)
    (if (< (abs (- golden-guess golden-ratio)) eps)
      k
      (find-appropriate-precision proc (+ k 1) eps))))

;;;(find-appropriate-precision cont-frac 1 0.0001)
(find-appropriate-precision cont-frac-iter 1 0.0001)
