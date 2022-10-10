(define (factorial-recursive n)
    (if (= n 1)
        1
        (* n (factorial-recursive (- n 1)))))

(factorial-recursive 3)