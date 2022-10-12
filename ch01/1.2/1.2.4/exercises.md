# 1.2.4's exercises

## 1.16
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