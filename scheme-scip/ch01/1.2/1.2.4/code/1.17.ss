 ;(define (* a b)
 ;   (if (= b 0)
 ;   0
 ;   (+ a (* a (- b 1)))))

(define (double x)
    (+ x x))

(define (havlf x)
    (/ x 2))

(define (even? x)
    (= (remainder x 2) 0))

(define (times a b)
    (cond ((= b 0) 0)
        ((even? b) (times (double a) (havlf b)))
        (else (+ a (times a (- b 1))))))

(times 4 6)