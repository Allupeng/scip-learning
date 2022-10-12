(define (expt b n)
    (expt-iter b n 1))

(define (expt-iter b n cur)
    (if (= n 0)
    cur
    (expt-iter b (- n 1) (* cur b))))

(expt 2 1)
(expt 2 2)
(expt 2 3)
(expt 2 4)