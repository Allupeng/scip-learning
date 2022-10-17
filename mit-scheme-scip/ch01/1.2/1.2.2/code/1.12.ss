(define (f row col)
    (if (or (= row col) (= col 1))
        1
        (+ (f (- row 1) col) (f (- row 1) (- col 1)))))

(f 13 4)