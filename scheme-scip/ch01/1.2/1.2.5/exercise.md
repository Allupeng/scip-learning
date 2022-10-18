# 1.2.5's exercises

## 1.20

e process that a procedure generates is
of course dependent on the rules used by the interpreter.
As an example, consider the iterative gcd procedure given
above. Suppose we were to interpret this procedure using
normal-order evaluation, as discussed in Section 1.1.5. (e
normal-order-evaluation rule for if is described in Exercise
1.5.) Using the substitution method (for normal order), illustrate the process generated in evaluating `(gcd 206 40)` and
indicate the remainder operations that are actually performed. How many remainder operations are actually performed in the normal-order evaluation of `(gcd 206 40)`?
In the applicative-order evaluation?

```scheme
(define (GCD a b)
    (if (= b 0)
        a
        (GCD b (remainder a b))))
```

### 正则序
```scheme
(GCD 206 40)
(GCD 40(remainder 206 40)); a = 40, b = 6, t1 = (remainder 206 40)
(if (= t1 0) ...)
(GCD t1(remainder 40 t1)); a = 6, b = 4, t2 = (remainder 40 t1)

```


### 应用序

```scheme
(GCD 206 40)
(GCD 40 6)      ; (GCD 40 (remainder 206 40)
(GCD 6 4)       ; (GCD 6 (remainder 40 6))
(GCD 4 2)       ; (GCD 4 (remainder 6 4))
(GCD 2 0)       ; (GCD 2 (remainder 2 2))
2
```

对于应用序来说，remainder是5次调用顺序