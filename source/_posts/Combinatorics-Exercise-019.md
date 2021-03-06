---
title: Combinatorics Exercise 019 象棋大师问题
date: 2019-03-13 18:39:19
top:
mathjax: true
category:
  - 数学
  - 组合数学
  - 计数组合
tags:
  - 习题
  - 抽屉原理
comments:
---

#### Title
一位国际象棋大师有 $11$ 周时间备战一场世锦赛，他决定每天至少下一盘棋；但为了不使自己过于疲劳，他还决定每周不能下超过 $12$ 盘棋. 试证：存在**连续**的若干天，期间这位大师**恰好**下了 $21$ 盘棋.

<!-- more -->

#### *Proof*
##### Version in textbook
设 $a_n$ 是前 $n$ 天所下的盘数，且因为每天至少下一盘棋，因此序列 $a_1$, $a_2$, $a_3$, $\cdots$, $a_{77}$ 是严格递增的，且因为每周下的盘数不超过 $12$，因此我们有 $a_{77} \leq 11 \times 12 = 132$. 从而，我们有
$$
1 \leq a_1< a_2 < \cdots < a_{77} \leq 132
$$
另外，考虑序列 $a_1+21$, $a_2+21$, $a_3+21$, $\cdots$, $a_{77}+21$ 也是严格递增的：
$$
22 \leq a_1+21 < a_2+21 < \cdots < a_{77}+21 \leq 153
$$
于是，如下的 $154$ 个数：
$$
a_1,\ a_2, a_3,\ \cdots,\ a_{77},\ a_1+21,\ a_2+21,\ a_3+21,\ \cdots,\ a_{77}+21
$$
中的每一个都是 $1$ 到 $153$ 之间的整数；由抽屉原理可知，它们当中必然有两个是相等的；
但因为，$\{a_n\}$ 和 $\{a_n+21\}$ 都是严格递增的，所以存在某个 $i$ 和 $j$ 使得 $a_i = a_j +21$. 从而，这位象棋大师在第 $j+1$ , $j+2$, $\cdots$, $i$ 天内恰总共下了 $21$ 盘棋.

<p align="right">Q.E.D.</p>

##### My Version
不妨设象棋大师总共下了 $n$ 盘棋，其中 $77 \leq n \leq 132$.
然后我们来构造 $n-21+1= n-20$ 个有序对：
$$
(0, 21),\ (1, 22),\ \cdots,\ (n-22, n-1),\ (n-21,n)
$$
有序对中的数字表示它是象棋大师下的第几盘棋.
然后，如果某一盘棋是当天大师所下的最后一盘棋，我们就将其对应数字染成黑色，否则染成白色；特别地，第 $0$ 盘棋也将涂成黑色.

于是 $1$ 至 $n$ 这 $n$ 个数中将恰好有 $77$ 个被染成黑色，剩下 $n-77$ 个数被染成白色. 即使考虑数字在有序对两边的重复出现，这些白色的数最多能覆盖也不超过 $2 \times(n-77)$ 个有序对.

此时注意到，“连续若干天恰好下了 $21$ 盘棋” 等价于 “存在一个两边都被染成黑色的序对”，进而等价于 “白色的数不足以覆盖所有的有序对”，我们现在就来证明此事.

对 有序对的数目 和 白色数字的数目 $x$ 作差，我们有
$$
f(n) = (n-20)-x \geq (n-20)-2\times(n-77)= 134-n
$$
从而 $f(n) \geq 2$ 即 $f(n)_{min} = 2$ (当 $n=132$ 时取得最小值)

于是可见，白色的数字任何时候都不能覆盖这些有序对，从而总存在某个有序对，其两边都被染成黑色，于是命题得证.

<p align="right">Q.E.D.</p>

#### Stronger Statement
条件不变，问：是否存在连续的若干天，这位大师恰好下了 $22$ 盘棋？

##### Version in textbook
*课本上的方法此时不能直接套用，需要进行一定的改动*

设 $a_n$ 是前 $n$ 天所下的盘数，且因为每天至少下一盘棋，因此序列 $a_1$, $a_2$, $a_3$, $\cdots$, $a_{77}$ 是严格递增的，且因为每周下的盘数不超过 $12$，因此我们有 $a_{77} \leq 11 \times 12 = 132$. 从而，我们有
$$
1 \leq a_1< a_2 < \cdots < a_{77} \leq 132
$$
另外，考虑序列 $22$, $a_1+22$, $a_2+22$, $\cdots$, $a_{76}+22$ 也是严格递增的：
$$
22 \leq a_1+22 < a_2+22 < \cdots < a_{76}+22 \leq 153
$$
于是，如下的 $154$ 个数：
$$
a_1,\ a_2, a_3,\ \cdots,\ a_{77},\ 22,\ a_1+22,\ a_2+22,\ \cdots,\ a_{76}+22
$$
中的每一个都是 $1$ 到 $153$ 之间的整数；由抽屉原理可知，它们当中必然有两个是相等的；
但因为，$\{a_n\}$ 和 $\{a_n+22\}$ 都是严格递增的，所以存在某个 $i$ 和 $j$ 使得 $a_i = a_j +22$，或者存在某个 $i
$ 使得 $a_i = 22$. 从而，这位象棋大师在第 $j+1$ , $j+2$, $\cdots$, $i$ 天内，或者前 $i$  天内恰总共下了 $22$ 盘棋.

<p align="right">Q.E.D.</p>


##### My Version
*笔者的解法几乎无需任何改动（除了改一下数字之外），可直接用以证明此加强命题*

不妨设象棋大师总共下了 $n$ 盘棋，其中 $77 \leq n \leq 132$.
然后我们来构造 $n-22+1= n-21$ 个有序对：
$$
(0, 22),\ (1, 23),\ \cdots,\ (n-23, n-1),\ (n-22,n)
$$
有序对中的数字表示它是象棋大师下的第几盘棋.
然后，如果某一盘棋是当天大师所下的最后一盘棋，我们就将其对应数字染成黑色，否则染成白色；特别地，第 $0$ 盘棋也将涂成黑色.

于是 $1$ 至 $n$ 这 $n$ 个数中将恰好有 $77$ 个被染成黑色，剩下 $n-77$ 个数被染成白色. 即使考虑数字在有序对两边的重复出现，这些白色的数最多能覆盖也不超过 $2 \times(n-77)$ 个有序对.

此时注意到，“连续若干天恰好下了 $22$ 盘棋” 等价于 “存在一个两边都被染成黑色的序对”，进而等价于 “白色的数不足以覆盖所有的有序对”，我们现在就来证明此事.

对 有序对的数目 和 白色数字的数目 $x$ 作差，我们有
$$
f(n) = (n-21)-x \geq (n-20)-2\times(n-77)= 133-n
$$
从而 $f(n) \geq 1$ 即 $f(n)_{min} = 1$ (当 $n=132$ 时取得最小值)

于是可见，白色的数字任何时候都不能覆盖这些有序对，从而总存在某个有序对，其两边都被染成黑色，于是命题得证.

<p align="right">Q.E.D.</p>

#### Summary
其实笔者的方法和教材的方法是等价的，只不过前者的表述不如后者那样简洁，但是却更强——前者可以直接用以证明修正后的命题；

之所以说前者更强的原因是，笔者的方法构造的有序对中已经包含了 $(0, 21)$这一对象，即已经考虑了 “前面连续的若干天也有可能恰好下 $21$ 盘棋” 的情况，相当于把教材中针对扩展命题的修正手段也包含了进来，这一点从 $f(n)_{min} = 2$ （余量很充分）可以见得.