(define (fib n)
    (fib-iter 1 0 0 n))

(define (fib-iter a b counter max)
    (if (= counter max)
        b
        (fib-iter (+ a b) a (+ counter 1) max)))

(fib 2)