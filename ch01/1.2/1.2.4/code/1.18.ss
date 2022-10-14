(define (double x)
    (+ x x))

(define (havlf x)
    (/ x 2))

(define (even? x)
    (= (remainder x 2) 0))

(define (odd? x)
    (= (remainder x 2) 1))

(define (multi a b)
    (multi-iter a b 0))

(define (multi-iter a b cur)
    (cond ((= b 0) 
            cur)
        ((even? b) 
            (multi-iter (double a)
                        (havlf b)
                        cur))
        ((odd? b) 
            (multi-iter a 
                        (- b 1) 
                    (+ a cur)))))

(multi 1 4)