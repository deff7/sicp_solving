(load "utils.scm")
(load "point.scm")

(define (sum-interval a b)
  (make-interval
    (+ (lower-bound a) (lower-bound b))
    (+ (upper-bound a) (upper-bound b))))

(define (sub-interval a b)
  (make-interval 
    (- (lower-bound a) (upper-bound b))
    (- (upper-bound a) (lower-bound b))))

(define (mul-interval a b)
  (let ((p1 (* (lower-bound a) (lower-bound b)))
        (p2 (* (lower-bound a) (upper-bound b)))
        (p3 (* (upper-bound a) (lower-bound b)))
        (p4 (* (upper-bound a) (upper-bound b))))
    (make-interval
      (min p1 p2 p3 p4)
      (max p1 p2 p3 p4))))

(define (div-interval a b)
  (if (and
        (not (= (upper-bound b) 0))
        (not (= (lower-bound b) 0)))
    (mul-interval a
      (make-interval
        (/ 1.0 (upper-bound b))
        (/ 1.0 (lower-bound b))))
    (println "Error! Division by zero")))

(define (print-interval i)
  (print-point i))

(define (make-interval a b)
  (cons a b))

(define (lower-bound i)
  (car i))

(define (upper-bound i)
  (cdr i))

(define (interval-radius i)
  (/ (- (upper-bound i) (lower-bound i)) 2.0))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2.0))

(define (width i)
  (interval-radius i))

(define (print-cw i)
  (newline)
  (display (center i))
  (display "±")
  (display (width i)))

(define (make-center-percent c p)
  (let ((percent (* c (/ p 100))))
    (make-interval (- c percent) (+ c percent))))

(define (percent i)
  (* 100 (/ (width i) (center i))))

(define (print-cp i)
  (newline)
  (display (center i))
  (display "±")
  (display (percent i))
  (display "%"))
