(load "utils.scm")
(load "point.scm")

;;; Abstract barrier

(define (square-rect r)
  (* (width r)
     (height r)))

(define (perim-rect r)
  (+ (* (width r) 2)
     (* (height r) 2)))

;;; Test procedure

(define (test-rect r)
  (println (square-rect r))
  (println (perim-rect r)))

;;; The first implementation

(define (make-rect a b)
  (cons a b))

(define (top-left r)
  (car r))

(define (bottom-right r)
  (cdr r))

(define (abs-sub a b)
  (abs (- a b)))

(define (width r)
  (abs-sub
    (x-point (top-left r))
    (x-point (bottom-right r))))

(define (height r)
  (abs-sub
    (y-point (top-left r))
    (y-point (bottom-right r))))

;;; Test it

(test-rect (make-rect (make-point -1 1) (make-point 1 -1)))

;;; The second implementation

(define (make-rect p w h)
  (cons p (cons w h)))

(define (zero-rect r)
  (car r))

(define (measures r)
  (cdr r))

(define (width r)
  (car (measures r)))

(define (height r)
  (cdr (measures r)))

;;; Test it

(test-rect (make-rect (make-point 0 0) 5 6))
(test-rect (make-rect (make-point -4 6) 5 6))
