(define eps 0.00001)

(define (fixed-point-common proc f start)
  (define (close-enough? a b) (< (abs (- a b)) eps))
  (define (iter guess)
    (let ((next-guess (f guess)))
      (proc guess)
      (if (close-enough? guess next-guess)
        guess
        (iter next-guess))))
  (iter start))

(define (fixed-point f start)
  (fixed-point-common (lambda (x) x) f start))

(define (fixed-point-log f start)
  (let ((counter 0))
    (fixed-point-common (lambda (x)
                          (set! counter (+ counter 1))
                          (newline)
                          (display x))
                        f
                        start)
    (newline)
    (display "Steps: ")
    (display counter)))

(define (sqrt x)
  (fixed-point (lambda (y) (/ (+ y (/ x y)) 2)) 1.0))

(define golden-ratio (fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0))
