(define (expt b n)
    (expt-iter b n 1))

(define (square x)
    (* x x))

(define (is-even n)
    (= (remainder n 2) 0))

(define (is-odd n)
    (= (remainder n 2) 1))

(define (expt-iter b n cur)
    (if (= n 0)
        cur
        (cond ((is-even n) 
                (expt-iter (square b) (/ n 2) cur))
              ((is-odd n) 
                (expt-iter b (- n 1) (* cur b))))))

(expt 2 2)
(expt 2 4)
(expt 2 8)
(expt 2 16)