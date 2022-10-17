;定义三个数 pre cur last
;pre = 0 cur = 1 last = 2
; if n >= 3
; f(3) = last + 2*cur + 3*pre
; last <- last + 2*cur + 3*pre
; pre <- cur
; cur <- last

(define (f n)
    (if (< n 3)
        n
        (f-iter 0 1 2 (- n 2))))

(define (f-iter pre cur last count)
    (if (= count 0)
        last
        (f-iter cur last (+ last (* 2 cur) (* 3 pre)) (- count 1))))

(f 5)