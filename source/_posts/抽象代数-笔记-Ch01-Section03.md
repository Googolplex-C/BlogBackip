---
title: 抽象代数 笔记 Ch01 Section03
date: 2019-02-23 14:57:10
top:
mathjax: true
category:
  - 数学
  - 抽象代数
tags:
  - 子群
  - 商群
comments:
---

接上一篇笔记 [抽象代数 笔记 Ch01 Section02 P2](https://googolplex-c.github.io/2019/02/21/抽象代数-笔记-Ch01-Section02-P2/)

<!-- more -->

### Chapter 1 群（续）

#### Section 3 子群与商群

邓老师：抽代课程的一个基本套路是，讲完一个代数体系的定义和性质之后，一般就开始讲子体系和商体系；原因有几点：

1. 就是要有足够多的例子，如果没有什么例子，学抽代很难展开；
2. 通过子体系和商体系来研究代数体系本身；

##### 定义 1.3.1 

设 $G$ 是群，$H \subseteq G$ 是**非空**子集，若 $H$ 在 $G$ 的运算下构成群，则称 $H$ 是 $G$ 的子群，记作 $H <G$ 

##### 例 1

考虑数域 $\mathbb{P}_1 \subseteq \mathbb{P}_2$ ，则 $\{\mathbb{P}_1,+\} < \{\mathbb{P}_1,+\}$；

另有，正实数集合是不包含 $0$ 的实数集合的子群，即：$\{\mathbb{R}^+, \cdot\} < \{\mathbb{R}^*, \cdot\}$

以及，$\{\{-1,1\},\cdot\} < \{\mathbb{R}^*,\cdot\}$

此外，我们断言：$\{\mathbb{R}^*,+\}$ 不是 $\{\mathbb{R}, \cdot\}$ 的子群，因为它们的运算不一样

##### 例 2

设 $\mathbb{V}$ 是线性空间，$\mathrm{dim} \mathbb{V} < \infty$，$S_{\mathbb{V}}$ 是 $\mathbb{V}$ 的全变换群，设 $\mathrm{GL}(\mathbb{V})$ 为所有可逆的线性变换组成的集合，有 $\mathrm{GL}(\mathbb{V}) < S_{\mathbb{V}}$ ，称其为 $\mathbb{V}$ 上的一般线性群；

记 $\mathrm{SL}(\mathbb{V})$ 为 $\mathbb{V}$ 中行列式为 $1$ 的线性变换的集合，则有 $\mathrm{SL}(\mathbb{V}) < \mathrm{GL}(\mathbb{V})$ ，称之为特殊线性群

假设 $\mathbb{V}/\mathbb{P}$ ，即线性空间是在数域上的，则 $\mathrm{GL}(n,\mathbb{P})$ 为所有可逆的 $n$ 阶矩阵组成的集合，也称为一般线性群；

同理 $\mathrm{SL}(n,\mathbb{P})$ 为 $\mathbb{V}$ 中行列式为 $1$ 的 $n$ 阶方阵的集合，也称为特殊线性群；

事实上，这两种版本的线性群是同构的；

##### 例 3

令 $m\mathbb{Z}=\{mn \mid  n \in \mathbb{Z}\}$，其中 $m \in \mathbb{N}$，于是 $m\mathbb{Z} < \mathbb{Z}$ （运算为加法）



$H$ 与 $G$ 的运算一致，可以推出：$G$ 的幺元 $e \in H$；

对于任意的 $h \in H$，其逆元 $h^{-1} \in H$

##### 定理 1.3.1 

设 $G$ 是群，$H \subseteq G$ 是非空子集，则以下三个命题等价：

1. $H <G$
2. $\forall a,b \in H,ab \in H, a^{-1}\in H$
3. $\forall a,b \in  H, ab^{-1} \in H$

*Proof*

由 1 推出 2，显然

由 2 推出 3，显然

由 3 推出 1：此时我们需要根据群的四条公理来证明：

$\forall a, b \in H,ab^{-1} \in H$，从而 $aa^{-1} \in H$ 即 $e \in H$，于是我们证明了幺元属于 $H$

把幺元 $e$ 代入 $a$，于是 $b^{-1} =eb^{-1} \in H$，于是我们证明了任意元素的逆元存在；

继续把 $b^{-1}$ 代入 $b$ 我们可以看到，$a(b^{-1})^{-1}=ab \in H$，从而我们证明了封闭性；

由于 $H$ 是 $G$ 的子集，而 $G$ 上的运算满足结合律，并且我们已经证明了封闭性，所以 $H$ 上结合律是自然成立的；

从而 $H$ 是子群

<p align="right">Q.E.D.</p>

##### 命题 1.3.2 

设 $H$ 是群 $G$ 的**有限**非空子集，则我们有：

$H <G$，当且仅当 $H$ 对运算封闭

*Proof*

必要性显然；

我们来证明充分性.

因为 $H$ 对运算封闭，且以 $G$ 的角度而言，结合律在 $G$ 上成立，从而结合律在 $H$ 上成立，从而 $H$ 是一个有限半群；

另外，因为 $H$ 是群 $G$ 的**有限**非空子集，从而消去律是自然成立的，从而由 命题 1.2.6 可知，$H$ 是群；

<p align="right">Q.E.D.</p>

注解：这个命题是上一个命题中的 2 的一个变形，原来的 “非空子集” 加强为 “有限非空子集”，而 $a^{-1} \in H$ 被弱化了；

##### 命题 1.3.3 子群的性质

若 $H_1 < G$ , $H_2 <G$，则 $H_1 \cap H_2 <G$

*Proof*

首先可见 $e \in H_1 \cap H_2$，所以 $H_1 \cap H_2$ 不是空集；

对于一切的 $a,b \in H_1 \cap H_2$，则 $a,b \in H_1$ 且 $a,b \in H_2$，由命题 1.3.2 可知

故 $ab^{-1} \in H_1$，且 $ab^{-1} \in H_2$，故 $ab^{-1} \in H_1 \cap H_2$，故 $H_1 \cap H_2 < G$

<p align="right">Q.E.D.</p>

思考题：

如果是 $H_1 \cup H_2$ 呢，它何时是 $G$ 的子群？



##### 定义 1.3.2 陪集

设 $G$ 是群，$H <G$，$a \in G$，定义 $aH=\{ah \mid h \in H\}$，以及 $Ha =\{ha \mid h \in H\}$ 分别是 $a$ 为代表元的 $H$ 的一个左陪集，以及 $a$ 为代表元的 $H$ 的一个右陪集

##### 定理 1.3.4

设 $G$ 是群，$H <G$，定义关系 $R$ 如下：$a\, R\, b \Leftrightarrow a^{-1}b \in H$，那么关系 $R$ 是等价关系. $a$ 所在的等价类 $\overline{a}=aH$，故 $a$ 的所有左陪集构成 $G$ 的一个分类.

*Proof*

$R$ 是关系：这是显然的，因为 $a^{-1}b$ 要么属于 $H$，要么不属于 $H$

$R$ 是等价关系，下面进行验证：

1. 自反性：$\forall a \notin G, a^{-1}a  = e\in H$，因为子群中必有幺元；
2. 对称性：若 $a\,R\,b$，集











