;转换为前缀表达式
;(/ 3 (+ (/ x (square y)) (* 2 y)))
(define (square x)
    (* x x))

(define (cube x)
    (* x x x))

(define (cube-root-iter guess x)
    (if (good-enough? guess x)
        guess
        (cube-root-iter (improve guess x) x)))

(define (good-enough? guess x)
    (< 
    (abs(- (cube guess) x)) 
    0.000001))

(define (improve guess x)
    (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root x)
    (cube-root-iter 1.0 x))

(cube-root 27)