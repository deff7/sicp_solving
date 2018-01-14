(define (search f a b)
  (let ((x (/ (+ b a) 2)))
    (if (close-enough? a b)
      x
      (if (> (f x) 0)
        (search f a x)
        (search f x b)))))

(define (close-enough? a b) (< (abs (- b a)) 0.001))

(define (positive? a) (> a 0))
(define (negative? a) (< a 0))

(define (error message) (display message))

(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
        (cond ((and (negative? a-value) (positive? b-value)) (search f a b))
              ((and (negative? b-value) (positive? a-value)) (search f b a))
              (else (error "Wrong value of a or b")))))

(half-interval-method sin 2.0 4.0)
(half-interval-method (lambda (x) (- (* x x x) (* 2 x) 3)) 1.0 2.0)
