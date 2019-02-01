---
title: Combinatorics Exercise 001
mathjax: true
comments: true
category: 
    - 数学
    - 组合数学
    - 计数组合
tags: 
    - 习题
    - 抽屉原理
---

##### Title

已知 $n$ 个黑盒子中装有若干个可相互区分的元素，从这些盒子中取出所有元素装进 $n+1$ 个白盒子中，并使得所有白盒子非空. 试证明：存在两个元素，其中每一个元素原先所在的黑盒子元素数目大于其现处的白盒子元素数目. 

<!-- more -->  

##### *Proof*

记元素的总数目为 $N$，注意到由于所有的白盒子非空，因此 $N \geq n+1$ . 记白盒子为 $A_i$ ，其中 $1 \leq i \leq n+1$ . 记黑盒子为 $B_i$ ，其中 $1 \leq i \leq n$ .记盒子 $A$, $B$ 的元素数目为 $\lvert A \rvert$ , $\lvert B \rvert$.

不失其一般性，假定白盒子和黑盒子分别根据其元素数目按照非递增顺序排列，于是可知：
$$
\begin{equation}
\lvert A_1 \rvert \geq \lvert A_2 \rvert \geq \lvert A_3 \rvert \geq \cdots \geq \lvert A_{n+1} \rvert > 0
\label{one}
\end{equation}
$$

$$
\begin{equation}
\lvert B_1 \rvert \geq \lvert B_2 \rvert \geq \lvert B_3 \rvert \geq \cdots \geq \lvert B_{n} \rvert
\label{two}
\end{equation}
$$

分别定义有限长的集合列 $\{R\}_{k=1}^{n+1}$ , $\{S\}_{k=1}^{n}$ 如下：
$$
\begin{gather}
R_k = \bigcup_{i=1}^k A_i \qquad \text{where} \quad 1 \leq k \leq n+1\\
S_k = \bigcup_{i=1}^k B_i \qquad \text{where} \quad 1 \leq k \leq n
\label{three}
\end{gather}
$$
注意到 $A_i \cap A_j = \varnothing$  ,  $B_i \cap B_j = \varnothing$ （其中 $i \neq j$  ），因此有：
$$
\begin{gather}
\lvert R_k \rvert = \sum_{i=1}^k \, \lvert A_i \rvert \qquad \text{where} \quad 1 \leq k \leq n+1\\
\lvert S_k \rvert = \sum_{i=1}^k \, \lvert B_i \rvert \qquad \text{where} \quad 1 \leq k \leq n
\label{four}
\end{gather}
$$
不难得知：
$$
\begin{gather}
0 < \lvert R_1 \rvert < \lvert R_2 \rvert < \cdots < \lvert R_n \rvert < \lvert R_{n+1} \rvert  
\label{five_1}
\end{gather}
$$
$$
\begin{equation}
0 < \lvert S_1 \rvert \leq \lvert S_2 \rvert \leq \cdots \leq \lvert S_n \rvert
\label{five_2}
\end{equation}
$$

注意到，因为白盒子全部非空，所以集合序列 $\{R\}$ 严格递增.

对$\{R\}$ , $\{S\}$ 两个集合序列根据其基数大小按照非递减顺序进行归并排序，并且规定：

- 若存在 $i, j$ 使得$\lvert R_i \rvert = \lvert S_j \rvert$ ，则在归并得到的新序列中令 $S_j$ 排在 $R_i$ 之前.

易知按此方式构造得到的新序列唯一，且序列的最后一项为 $R_{n+1}$ ，倒数第二项为 $S_n$ .

1. 若第一项为 $R_1$：

   于是归并得到的序列具有如下的形式：
   $$
   \begin{equation}
   R_1, \  \cdots, \  S_n, \  R_{n+1}
   \label{six}
   \end{equation}
   $$
   由约束条件和$\{R\}$ , $\{S\}$ 的定义可知：
   $$
   \begin{equation}
   \lvert S_1 \rvert = \lvert B_1 \rvert > \rvert R_1 \rvert= \lvert A_1 \rvert  >0
   \label{seven}
   \end{equation}
   $$
   进而
   $$
   \begin{equation}
   \lvert S_1 \rvert = \lvert B_1 \rvert \geq 2
   \label{eight}
   \end{equation}
   $$
   即 $B_1$ 中至少有两个元素，显见这两个元素满足本题所欲证命题所述性质.

2. 若第一项为 $S_1$：

   于是归并得到的新序列具有如下的形式：
   $$
   \begin{equation}
   S_1, \  \cdots, \  S_n, \  R_{n+1}
   \label{nine}
   \end{equation}
   $$
   注意到序列中省略号部分为 $n$ 个来自序列 $\{R\}$ 的项以及  $n-2$ 个来自序列 $\{ S \}$ 的项. 
   由抽屉原理可知，存在 $1 \leq i \leq n-1, \ 1 \leq j \leq n-1$ 及 $k \geq 1$ 使得：
   $$
   \begin{equation}
   \lvert S_i \rvert \leq \underbrace{\lvert R_j \rvert < \cdots < \lvert R_{j+k} \rvert}_{存在至少\,2\,项(k\geq1)} < \lvert S_{i+1} \rvert
   \label{ten}
   \end{equation}
   $$
   即存在至少 $2$ 个来自序列 $\{R\}$ 的项，夹在来自序列 $\{S \}$ 的某相邻两项之间.  
   固定下标 $i,j,k$ ，进而有：
   $$
   \begin{align}
   &\lvert B_{i+1} \rvert = \lvert S_{i+1} \rvert - \lvert S_{i} \rvert \\
   &> \lvert R_{j+k} \rvert - \lvert R_{j} \rvert 
   = \sum_{p=1}^{k}\lvert A_{j+p} \rvert \\
   &\geq \lvert A_{j+1} \rvert
   \label{eleven}
   \end{align}
   $$
   于是：
   $$
   \begin{equation}
   \lvert B_1 \rvert \geq \cdots \geq \lvert B_{i+1} \rvert > \lvert A_{j+1} \rvert \geq \cdots \geq \lvert A_{n+1} \rvert >0
   \label{twelve}
   \end{equation}
   $$
   另外，可知：
   $$
   \begin{equation}
   \lvert S_{i+1} \rvert \geq \lvert R_{j} \rvert + 2
   \label{thirteen}
   \end{equation}
   $$
   从而
   $$
   \begin{equation}
   \lvert S_{i+1} \rvert + (N - \lvert R_j \rvert) \geq N+2 \quad \Longrightarrow \quad \left| \bigcup_{p=j+1}^{n+1} A_p\right| +\left| \bigcup_{q=1}^{i+1} B_q\right| \geq N+2
   \label{fourteen}
   \end{equation}
   $$
   注意到 $\left| (\bigcup_{p=j+1}^{n+1} A_p) \ \bigcup \   (\bigcup_{q=1}^{i+1} B_q) \right| \leq N$ 必然成立，由容斥原理可知：
   $$
   \begin{equation}
   \left| (\bigcup_{p=j+1}^{n+1} A_p) \ \bigcap \ (\bigcup_{q=1}^{i+1} B_q) \right| \geq 2
   \label{fifteen}
   \end{equation}
   $$
   直观而言，前 $i+1$ 个黑盒子的元素总数比前 $j$ 个白盒子的元素总数多 $2$ ，因此在重新装配的过程中，在前 $i+1$ 个黑盒子中存在至少两个元素，它们必将被 “抽补” 到第 $j+1$ 个白盒子及其（在序列 $\{A \}$ 中）之后的盒子中去；而这前 $i+1$ 个黑盒子中元素数最小的盒子的元素数 $\lvert B_{i+1} \rvert$ 比白盒子中具有最大元素数的白盒子的元素数目 $\lvert A_{j+1} \rvert$都大，于是这两个元素满足欲证命题所述性质.

综上所述，命题成立.	

<p align="right"> Q.E.D. </p>

