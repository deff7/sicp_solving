(load "helper.ss")

(define (iterative-improve good-enough? improve)
  (define max-iterations 100000)
  (define (iteration n x)
    (if (good-enough? x)
      x
      (if (= n max-iterations)
        (display "Error! Too many iterations")
        (iteration (+ n 1) (improve x)))))
  (lambda (x) (iteration 0 x)))

(define (sqrt x)
  ((iterative-improve
    (lambda (guess) (< (abs (- (square guess) x)) eps))
    (lambda (guess) (average (/ x guess) guess)))
    1.0))

(sqrt 25)

(define (fixed-point f x)
  ((iterative-improve
     (lambda (guess) (< (abs (- (f guess) guess)) eps))
     (lambda (guess) (f guess)))
   1.0))

(fixed-point cos 1.0)
