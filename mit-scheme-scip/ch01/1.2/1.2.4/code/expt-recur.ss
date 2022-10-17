(define (expt b n)
    (cond ((= n 0) 1)
          ((= n 1) b)
          (else (* (expt b (- n 1)) (expt b 1)))))

(expt 2 1)
(expt 2 2)
(expt 2 3)
(expt 2 4)