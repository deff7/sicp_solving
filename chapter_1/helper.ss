(define eps 0.00001)

(define (average a b) (/ (+ a b) 2))

(define (square x) (* x x))
(define (cube x) (* x x x))
(define (identity x) x)

(define (inc x) (+ x 1))
(define (divides? a b) (= (remainder a b) 0))

(define (close-to? a b precision)
  (< (abs (- a b)) precision))

(define (find-appropriate-precision value proc k eps)
  (let ((guess (proc k)))
    (newline)
    (display guess)
    (if (< (abs (- guess value)) eps)
      k
      (find-appropriate-precision value proc (+ k 1) eps))))

(define (benchmark proc)
  (define (report)
    (newline)
    (display "Elapsed time: ")
    (display (- (runtime) start)))
  (define start (runtime))
  (if (proc) (report)))
