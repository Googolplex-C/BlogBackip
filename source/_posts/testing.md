---
title: testing
date: 2019-01-10 14:49:23
category:
    - 其他
tags:
    - 博客测试
mathjax: true
comments: true
---

# 这是一篇测试用的文章

测试：博客的各种功能

# 插入图片

## 第一种方法

![cat](testing/cat.jpg)

​	以上是传统的方式：据说需要配合插件 hexo-asset-image
​	但我不想安装太多的插件，因此我还是选择第二种方式吧，lol

## 第二种方法


{% asset_img cat.jpg %}

以下是自动隐藏的内容。  
<!-- more -->

你真漂亮！  
我的宝贝。

# 插入PDF

{% pdf example.pdf %}

# 插入流程图

```flow
st=>start: 开始
e=>end: 结束
op1=>operation: 操作
sub1=>subroutine: 子流程
cond=>condition: yes or no ?
io=>inputoutput: 输入输出...
st->op1->cond
cond(yes)->io->e
cond(no)->sub1(right)->op1
```

# 插入时序图

```sequence
Alice->Bob: Hello Bob, how are you?
Note right of Bob: Bob thinks
Bob-->Alice: I am good thanks!
```

# 测试代码块

```
#include<iostream>

int main(){
	using namespace std;
	
	cout << "Fuck you" << endl;
	return 0;
}
```

以上是markdown本身的代码块语法.

{% codeblock tester [lang:c] %}
#include<iostream>

int main(){
	using namespace std;
	
	cout << "Fuck you" << endl;
	return 0;
}
{% endcodeblock %}


