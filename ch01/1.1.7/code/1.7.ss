(define (sqrt-iter guess x) 
   (if (good-enough? guess (improve guess x)) 
          (improve guess x) 
          (sqrt-iter (improve guess x) x)))

(define (good-enough? old-guess new-guess)
    (> 0.01 (/ (abs(- new-guess old-guess)) old-guess)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (square x)
    (* x x))

(define (f x)
    (sqrt-iter 1.0 x))

(* 3.162278058889937e-5 3.162278058889937e-5)

(f 0.000000001)

(f 10000000000000000000000000000000000000000)
