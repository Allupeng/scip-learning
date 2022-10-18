(define (fib-recur n)
    (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recur (- n 1)) (fib-recur (- n 2))))))

(fib-recur 2)
