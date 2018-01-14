(define (sum term a next b)
  (if (> a b)
    0
    (+ (term a)
       (sum term (next a) next b))))

(define (identity x) x)
(define (inc x) (+ x 1))

(define (cube x) (* x x x))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* dx
     (sum f (+ a (/ dx 2)) add-dx b)))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (g k) (* (f (+ a (* k h)))
                   (cond ((or (= k 0) (= k n)) 1.0)
                         ((even? k) 2.0)
                         (else 4.0))))
  (* (/ h 3)
     (sum g 0 inc n)))

(integral cube 0 1 0.01)
(simpson cube 0 1 100)
(integral cube 0 1 0.001)
(simpson cube 0 1 1000)
