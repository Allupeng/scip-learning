# 1.2.4's exercises

## 1.16 exercise
Design a procedure that evolves an iterative exponentiation process that uses successive squaring and uses a logarithmic number of steps, as does fast-expt.
(Hint: Using the observation that $(b^{\frac{n}{2}})^2=(b^2)^{\frac{n}{2}}$ , keep along with the exponent n and the base b, an additional state variable a, and define the state transformation in such a way that the product abn is unchanged from state to state.At the beginning of the process a is taken to be 1, and the answer is given by the value of a at the end of the process.In general, the technique of defining an invariant quantity that remains unchanged from state to state is a powerful way to think about the design of iterative algorithms.)

### solution
定义一个变量并初始化`cur = 1`
```scheme
(define (expt b n)
    (expt-iter b n 1))

(define (square x)
    (* x x))

(define (is-even n)
    (= (remainder n 2) 0))

(define (is-odd n)
    (= (remainder n 2) 1))

(define (expt-iter b n cur)
    (if (= n 0)
        cur
        (cond ((is-even n) 
                (expt-iter (square b) (/ n 2) cur))
              ((is-odd n) 
                (expt-iter b (- n 1) (* cur b))))))
```

## 1.17 exercise
 The exponentiation algorithms in this section are based on performing exponentiation by means of repeated multiplication. In a similar way, one can perform integer multiplication by means of repeated addition. The following multiplication procedure (in which it is assumed that our language can only add, not multiply) is analogous to the expt procedure:

 ```scheme
 (define (* a b)
    (if (= b 0)
    0
    (+ a (* a (- b 1)))))
 ```

 This algorithm takes a number of steps that is linear in b.Now suppose we include, together with addition, operations double, which doubles an integer, and halve, which divides an (even) integer by 2. Using these, design a multiplication procedure analogous to fast-expt that uses a logarithmic number of steps.

### solution

$a \times b$
