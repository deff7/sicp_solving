(define (sqrt-iter guess prev x improvefn)
  (if (good-enough? guess prev)
    guess
    (sqrt-iter (improvefn guess x)
               guess
               x
               improvefn)))

(define eps 0.0001)

(define (good-enough? guess prev)
  (< (abs (- guess prev)) (* guess eps)))

(define (square x) (* x x))

(define (improve guess x) (average guess (/ x guess)))

(define (improve3 guess x) 
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (average x y) (/ (+ x y) 2))

(define (mysqrt x) (sqrt-iter 1.0 0.0 x improve))

(define (sqrt3 x) (sqrt-iter 1.0 0.0 x improve3))

(sqrt3 27)
(sqrt3 125)
(sqrt3 2)


