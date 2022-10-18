;a % b = r GCD(a,b) = GCD(b,r)
(define (GCD a b)
    (if (= b 0)
        a
        (GCD b (remainder a b))))

(trace remainder)

(GCD 206 40)