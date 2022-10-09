# 2022-10-09

## 程序设计的基本元素

*   **基本表达形式**（primitive expressions）：用于语言所关心的最简单的个体
*   **组合的方法**（means of combination）：通过它们可以通过最简单的个体出发构造出复杂的元素
*   **抽象的方法**（means of abstraction）：通过它们可以为复合对象命名，并将它们视为单位去操作

### scheme定义变量

```scheme
define x 5
x
5
```

### scheme定义过程

```scheme
define (square x) (* x x)
square 5
25
```

那么在Lisp（或方言Scheme）语言中，以上三点体现为：

*   数和算术运算是基本的数据和过程
*   组合式的嵌套提供了一种组织起多个操作的方法
*   定义是一种受限的抽象手段，它为名字关联相应的值

## 求组合表达式的规则

1.   **求该组合式各个子表达式的值**
2.   **将最左表达式的值（运算符 the operator）运用于实际参数，实际参数是其他子表达式的值（运算对象 the operands）**

## 过程应用的代换模型

过程应用中的例子：`f 5`，相关函数定义如下

```scheme
;x^2
define (square x)
(* x x)
;x^2 + y^2
define (sum-of-squares x y) 
(+ (square x) (square y))
;wrap sum-of-squares
define (f a)
(sum-of-squares (+ a 1) (* a 2))
```

### 应用序

所谓应用序则是首先计算所有的子表达式，然后将最左表达式（运算符）应用到计算好的实际参数上。

运算过程如下

```scheme
(f 5)
;展开至
(sum-of-squares (+ 5 1) (* 5 2))
;计算好实际参数(+ 5 1)(* 5 2)
(sum-of-squares (6) (10))
;归约表达式sum-of-squares
(+ (square 6) (square 10))
;归约square
(+ (* 6 6) (* 10 10))
(+ 36 100)
136
```



### 正则序

先不求出运算对象的值，直到实际需要它们时再去计算。采用这种计算模型，就应该先用计算对象表达式来代换形式参数，直到替换为基本表达式为止

运算过程如下

```scheme
(f 5)
(sum-of-squares (+ 5 1)(* 5 2))
;归约sum-of-squares定义
(+ square(+ 5 1) square(* 5 2))
;归约square
(+ (* (+ 5 1) (+ 5 1)) (* (* 5 2) (* 5 2)))
;归约
(+ (* (6) (6)) (* (10) (10)))
(+ 36 100)
136
```

## 条件表达式和谓词

### cond

```scheme
(cond (<p1> <e1>)
      (<p2> <e2>)
      ......
      (<pn> <en>))
```

`cond`第二种形式：如果所有的谓词<pn>都为假，则返回else的值

```scheme
(cond (<p1> <e1>)
      (else en))
```

基本谓词 `<` `>` `=`

### if表达式

```scheme
(if <predicate> <consequent> <alternative>)
;解释器从<predicate>开始,如果值为真,那么解释器去求值<consequent>并返回其值,否则它就去求值<alternative>并返回其值
```

### 逻辑复合运算符

**and：**解释器从左至右一个个的求值\<e>，如果某个\<e>为假，这一and表达式就为假，如果前面的\<e>都求出真值，这一**and表达式**的值就是最后那个\<en>的值

```scheme
(and <e1> ... <en>)
```

**or：**如果某个\<e>为真，那么这个**or表达式**返回的就是这个\<e>的值，如果所有的\<e>都为假，那么这个**or表达式**的值就为假

```scheme
(or <e1> ... <en>)
```

**not：**如果\<e>为真，那么**not表达式**返回的就为假，反之亦然

```scheme
(not <e>)
```

