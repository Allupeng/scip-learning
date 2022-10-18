(define (coin-iter amount kinds-of-coin)
    (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((= kinds-of-coin 0) 0)
        (else (+ 
            (coin-iter amount (- kinds-of-coin 1)) 
            (coin-iter (- amount (coin-demonination kinds-of-coin)) kinds-of-coin)))))

(define (coin amount)
    (coin-iter amount 5))

(define (coin-demonination order)
    (cond ((= order 1) 1)
          ((= order 2) 5)
          ((= order 3) 10)
          ((= order 4) 25)
          ((= order 5) 50)))

(coin 100)