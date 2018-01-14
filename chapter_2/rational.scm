(define (gcd a b)
  (define (iter a b)
    (if (= b 0)
      a
      (gcd b (remainder a b))))
  (let ((a (abs a))
        (b (abs b)))
    (if (> a b)
      (iter a b)
      (iter b a))))

(define (normalize-sign n d)
  (if (or
        (and (> n 0) (< d 0))
        (and (< n 0) (> d 0)))
    (cons (- (abs n)) (abs d))
    (cons (abs n) (abs d))))


(define (make-rat n d)
  (let ((g (gcd n d)))
    (normalize-sign (/ n g) (/ d g))))

(define (numer x)
  (car x))

(define (denom x)
  (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat
    (+ (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat
    (- (* (numer x) (denom y))
       (* (numer y) (denom x)))
    (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat
    (* (numer x) (numer y))
    (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat
    (* (numer x) (denom y))
    (* (numer y) (denom x))))

(define (rat-equal? x y)
  (= (* (numer x) (denom y)) (* (numer y) (denom x))))

