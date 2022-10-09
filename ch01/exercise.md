# Ch01 Exercise

## **Exercise 1.1**

Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.

### **solution**

|                     expression                     |    output    |
| :------------------------------------------------: | :----------: |
|                         10                         |      10      |
|                     (+ 5 3 4)                      |      12      |
|                      (- 9 1)                       |      8       |
|                      (/ 6 2)                       |      3       |
|                (+ (* 2 4) (- 4 6))                 |      6       |
|      (**define** a 3) (**define** b (+ a 1))       | a = 3, b = 4 |
|                  (+ a b (* a b))                   |      19      |
|                      (= a b)                       |     true     |
|      (**if** (**and** (> b a) (< b (* a b)))       |      4       |
| (**cond** ((= a 4) 6)((= b 4) (+ 6 7 a))(else 25)) |      16      |
|             (+ 2 (**if** (> b a) b a))             |      6       |
| (* (cond ((> a b) a)((< a b) b)(else -1))(+ a 1))  |      16      |

## **Exercise 1.2** 

Translate the following expression into prefifix

### **solution**

```scheme
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) 
(* 3 (- 6 2) (- 2 7)))
```

## **Exercise 1.3**

 Defifine a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

### **solution**

```scheme
;define suqare procedure
(define (squares x)
    (* x x))
;define larger
(define (larger-num x y)
    (if (< x y) y x))    
;define sum-of-squares
(define (sum-of-squares x y z)
    (+ (squares (larger-num x y)) (squares (larger-num y z))))

(sum-of-squares 10 10 1)
```

## **Exercise 1.4**

 Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

### solution

如果`a > b`那么执行(+ a b)，如果`a <= b`那么执行(- a b)

作用为`a + |b|`

## **Exercise 1.5**

Ben Bitdiddle has invented a test to determine whether the interpreter he is faced with is using applicative

order evaluation or normal-order evaluation. He defifines the following two procedures:

```scheme
(define (p) (p))
(define (test x y) 
  (if (= x 0) 0 y))
```

Then he evaluates the expression

`(test 0 (p))`

What behavior will Ben observe with an interpreter that uses applicative-order evaluation? What behavior will he observe with an interpreter that uses normal-order evaluation? Explain your answer. (Assume that the evaluation rule for the special form if is the same whether the interpreter is using normal or applicative order: The predicate expression is evaluated fifirst, and the result determines whether to evaluate the consequent or the alternative expression.)

### solution

#### 应用序(applicative-order)

```scheme
(test 0 (p))
;calculate 0 and (p)
;(p) is a self-loop
```

由于应用序在调用时会将被传入的所有实际参数进行计算，所以解释器在执行`(test 0 (p))`的时候会进入死循环.

#### 正则序(normal-order)

```scheme
(test 0 (p))
;
(if (= 0 0) 0 (p))
;
0
```

而在正则序计算规则当中,传入的实际参数只有在需要的时候才进行计算.所以,在使用正则序计算的解释器当中运行`(test 0 (p))`, `0`和`(p)`都不会被立马计算.当解释器运算到`(if (= 0 0) 0 (p))`时,只有x的参数被计算,所以if语句返回0值,与`(p)`无关.所以在正则序当中,调用(p)始终没有被执行,所以不会产生死循环。

因此，如果一个解释器运行该procedure返回0，代表这个解释器是根据正则序进行计算的。如果陷入死循环，那么代表是使用应用序进行计算的。