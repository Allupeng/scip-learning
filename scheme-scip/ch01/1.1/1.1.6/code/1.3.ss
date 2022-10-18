;define suqare procedure
(define (squares x)
    (* x x))
;define larger
(define (larger-num x y)
    (if (< x y) y x))
;define smaller    
(define (smaller-num x y)
    (if (< x y) x y))        
;define sum-of-squares
(define (sum-of-squares x y z)
    (+ (squares(larger-num x y)) (squares(larger-num (smaller-num x y) z))))

(sum-of-squares 1 10 2)