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

$a \times b=(a+a+...+a)$这里根据奇偶数可以

$$
f(a) = 
\begin{cases}
    2\times(a\times\frac{b}{2}) & \text{, b为偶数}\newline
    a +(b-1)*a & \text{, b为奇数}\newline
\end{cases}
$$ 

```scheme
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
```

而该运算结果是基于递归过程的

## 1.18 exercise
Using the results of **Exercise 1.16** and **Exercise 1.17**, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps.

### solution
**exercise 1.17**是基于递归过程的时间复杂度为对数的计算过程。  
现在需设计一个基于iterative的计算过程来计算两数乘积。  
首先定义一个变量`cur = 0`，`cur <- a + cur`这个运行`b`次

```scheme
(define (double x)
    (+ x x))

(define (havlf x)
    (/ x 2))

(define (even? x)
    (= (remainder x 2) 0))

(define (odd? x)
    (= (remainder x 2) 1))

(define (multi a b)
    (multi-iter a b 0))

(define (multi-iter a b cur)
    (cond ((= b 0) 
            cur)
        ((even? b) 
            (multi-iter (double a)
                        (havlf b)
                        cur))
        ((odd? b) 
            (multi-iter a 
                        (- b 1) 
                    (+ a cur)))))
```