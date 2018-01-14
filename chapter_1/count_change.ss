(define steps 0)

(define (count-change amount)
  (cc amount 5))

(define (cc amount kind)
  (set! steps (+ steps 1))
  (cond ((= amount 0) 1)
        ((or (= kind 0) (< amount 0)) 0)
        (else (+ (cc amount (- kind 1))
                 (cc (- amount (denomination kind)) kind)))))

(define (denomination kind)
  (cond ((= kind 1) 1)
        ((= kind 2) 5)
        ((= kind 3) 10)
        ((= kind 4) 25)
        ((= kind 5) 50)))

(count-change 13)
(display "Steps: ")
(display steps)
