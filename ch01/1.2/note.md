# 1.2 过程及产生的计算（2022-10-10）

## 1.2.1 线性的递归和迭代

### 递归

阶乘公式的定义为
$$
n! = n · (n-1)·(n-2)···3·2·1
$$
然后通过以上定义，可以衍生计算`n!`的方法，对于一个正整数`n`，`n! = (n - 1)!·n `

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

