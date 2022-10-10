# 1.1.7’s Exercise

## Exercise 1.6

Alyssa P. Hacker doesn’t see why if needs to be provided as a special form. “Why can’t I just define it as an ordinary procedure in terms of cond?” she asks. Alyssa’s friend Eva Lu Ator claims this can indeed be done, and she defines a new version of if:

```scheme
(define 
  (new-if predicate then-clause else-clause) 
  (cond (predicate then-clause) 
        (else else-clause)))
```

Eva demonstrates the program for Alyssa

`(new-if (= 2 3) 0 5)`

`5`

`(new-if (= 1 1) 0 5)`

`0`

Delighted, Alyssa uses new-if to rewrite the square-root program:

```scheme
(define (sqrt-iter guess x) 
  (new-if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) x)))
```

What happens when Alyssa attempts to use this to compute square roots? Explain.

### solution

```scheme
;用if执行的sqrt-iter
(define (sqrt-iter guess x) 
   (if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) x)))
```

```scheme
;用new-if执行的sqrt-iter
(define (new-if predicate consequent alternative)
    (cond (predicate consequent)
        (else alternative)))
        
(define (sqrt-iter guess x) 
   (new-if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) x)))
```

执行用`new-if`执行的`sqrt-iter`函数会报错`Aborting!: maximum recursion depth exceeded`

解释器表明该程序的调用栈（stack）超过了允许的最大范围。

这是由于`if`与`new-if`的表现不同导致的.

`(if predicate consequent alternative)` 如果`predicate`为真，那么只执行`consequent`的内容。如果`predicate`为假，那么只执行`alternative`的内容。

而`new-if`是一个普通的过程(procedure)，那么按照解释器的**应用序（applicative-order）**求值规则，会将所有的实际参数计算完毕，再进行计算。

而`new-if`的`sqrt-iter`下又调用了`sqrt-iter`.这样就无限递归了.

可以用以下语句来验证`if`与`new-if`的区别

```scheme
(if #t (display "true") (display "false"))

(new-if #t (display "true") (display "false"))
```

`if`只会输出`true`，而`new-if`会输出`falsetrue`，这代表`new-if`两个表达式都被求值计算了。

## Exercise 1.7

The good-enough? test used in computing square roots will not be very effective for finding the square roots of very small numbers. Also, in real computers, arithmetic operations are almost always performed with limited precision. This makes our test inadequate for very large numbers. Explain these statements, with examples showing how the test fails for small and large numbers. An alternative strategy for implementing good-enough? is to watch how guess changes from one iteration to the next and to stop when the change is a very small fraction of the guess. Design a square-root procedure that uses this kind of end test. Does this work better for small and large numbers?

```scheme
(define (sqrt-iter guess x) 
   (if (good-enough? guess x) 
          guess 
          (sqrt-iter (improve guess x) x)))

(define (improve guess x)
    (average guess (/ x guess)))

(define (average x y)
    (/ (+ x y) 2))

(define (good-enough? guess x)
    (< (abs(- (square guess) x)) 0.001))

(define (square x)
    (* x x))

(define (f x)
    (sqrt-iter 1.0 x))
```

### solution

当计算的`x`特别小时计算会不准确。

`(f 0.000000001)`

当计算的`x`特别大时会陷入死循环。

`(f 10000000000000000000000000000000000000000)`

由于之前的`good-enough?`方法是通过精确度来进行求值计算，而通过比值来进行计算更合理

```scheme
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

```

## Exercise 1.8

Newton’s method for cube roots is based on the fact that if `y` is an approximation to the cube root of `x`, then a better approximation is given by the value
$$
\frac {x/y^2 + 2y}{3}
$$
Use this formula to implement a cube-root procedure analogous to the square-root procedure. (In Section 1.3.4 we will see how to implement Newton’s method in general as an abstraction of these square-root and cube-root procedures.)

### solution

```scheme
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
```

