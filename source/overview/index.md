---
title: 本站概览
date: 2019-01-11 20:47:50
type: "overview"
comments: false
---

#### 地图

#### 1. 站点地图

我的博客页面组织架构如下所示：

```flow
st=>start: 本站点
e=>end: 维护者
op1=>operation: 主页
op2=>operation: 标签
op3=>operation: 文章存档
op4=>operation: 本站概览*
op5=>operation: 留言板
lib1=>subroutine: 文章库
lib2=>subroutine: 留言库
st->op1
op1->op2
op1->op3
op1->op4
op1->op5

```

