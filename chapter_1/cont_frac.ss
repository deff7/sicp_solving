(define (cont-frac n d k)
  (define (iter i)
    (let ((ni (n i))
          (di (d i)))
      (if (= i k) (/ ni di)
        (/ ni (+ di (iter (+ i 1)))))))
  (iter 1))

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= i 0)
      result
      (let ((ni (n i))
            (di (d i)))
        (iter (- i 1) (/ ni (+ di result))))))
  (iter k 0))

