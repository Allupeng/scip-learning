(define (square x)
    (* x x))

(define (is-even n)
    (= (remainder n 2) 0))

((define (expt b n)
    (cond ((= n 0) 1)
        ((is-even n) (square (expt b (/ n 2))))
        (else (* (expt b (- n 1)) (expt b 1))))))

(expt 2 2)
(expt 2 4)
(expt 2 8)
(expt 2 16)