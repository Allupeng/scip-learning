# 1.2 过程及产生的计算（2022-10-10）

## 1.2.1 线性的递归和迭代

阶乘公式的定义为
$$
n! = n · (n-1)·(n-2)···3·2·1
$$
然后通过以上定义，可以衍生计算`n!`的方法，对于一个正整数`n`，`n! = (n - 1)!·n `

### 递归

我们可以通过该定义定义函数

```scheme
(define (factorial-recursive n)
    (if (= n 1)
        1
        (* n (factorial-recursive (- n 1)))))

(factorial-recursive 3)
```

### 迭代

我们再以另外的一个眼光来看待阶乘计算。将`n!`的定义修改为：我们首先用`1*2`，再用结果*`3`，直至乘至`n`为止。

我们通过维护一个`product`变量来保存乘积的结果，用`counter`变量来保存迭代的次数

`product <- product * counter`

`counter <- counter + 1`

那么对应的`procedure`可以被定义为

```scheme
(define (factorial n)
    (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
    (if (> counter max-count)
    product
    (fact-iter 
    (* product counter)
    (+ 1 counter)
    max-count)))
```

## 1.2.2 树形递归

斐波那契数列的定义为
$$
F(n) =
\begin{cases}
0, & n = 0\\
1, & n = 1 \\
F(n-1) + F(n-2) & else
\end{cases}
$$

### 递归
我们很容易的可以通过该定义写出一个递归`procedure`
```scheme
(define (fib-recur n)
    (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib-recur (- n 1)) (fib-recur (- n 2))))))
```
但是**递归模型**下对于一些值进行了重复计算

### 迭代
对于斐波那契数列的定义，我们可以参考阶乘计算的定义。计算`Fib(n)`首先是`Fib(0) + Fib(1)` 计算出`Fib(2)`，然后通过`Fib(1) + Fib(2)`计算出`Fib(3)`，以此类推，直至计算到`Fib(n)`
所以定义两个数a、b，将a = Fib(1) b = Fib(0)
`a <- a + b`
`b <- a`
```scheme
(define (fib n)
    (fib-iter 1 0 0 n))

(define (fib-iter a b counter max)
    (if (= counter max)
        b
        (fib-iter (+ a b) a (+ counter 1) max)))
```
