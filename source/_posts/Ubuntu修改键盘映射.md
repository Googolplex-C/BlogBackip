---
title: 'Ubuntu 修改键盘映射'
date: 2019-03-12 19:25:58
top:
mathjax: ture
category:
  - 手工实践
tags:
  - 键位映射
  - 打字
  - 'Ubuntu 系统'
comments:
---

日常折腾.

<!-- more -->

##### 1. 需求
笔者的输入特点：

1. 中英混杂  
尤其是在写博客的时候;

2. 大量符号  
无论是 LaTeX 公式 还是代码 ( LaTeX 源码本质上也是一种代码 ) 都含有大量的标点符号;

3. 需要经常用到各种功能键  
这一点可以从前两点看出;

##### 2. 现状
1. 笔者自己分析过为什么 写博客 记笔记 敲代码 这些事情在自己身上难以坚持下去, 或者说总有一种 “不畅快感”, 后来发现打字的问题占了很大一部分原因; 笔者之前一直在使用 二指禅 式打字法, 以写博客时输入公式为例子: 如果笔者需要写完一篇介绍某个定理的博客, 那么笔者在打字的时候同时完成以下几件事:

    1. 思考这个定理的证明过程
    2. 组织证明语言
    3. 回想 LaTeX 代码
    4. 在键盘上寻找各个字符的位置, 用蹩脚的指法输入

    对比一下用笔写的过程, 只需要完成前两步, 就可以流利地用笔把内容写出来.   
    抽象程度高的非机械性的工作想要顺畅地完成, 就必须依赖于更为底层的工作的良好运行, 以避免精力的分散;








##### 3. 调整 `Ctrl` `Caps Lock` 和 `Shift` 的位置
`Cap Lock` 键是最不常用的, 偏偏其位置又是个风水宝地, 因此必须让它有多远滚多远;

按理来说, 目前网上能搜到的最常见的调整方式是将 `Ctrl` 和 `Caps Lock` 互换, `Shift` 保持原位置不变

笔者还没有真正地尝试这种调整方法, 但是笔者印象中 `Shift` 键比 `Ctrl` 键更为常用, 因为代码中包含大量的符号, 而笔者目前还没有养成 左符右`Shift` 和 右符左`Shift` 的习惯,因此笔者打算将 左`Shift`键 挪到原来 `Caps Lock` 的位置上, 这样做还有另一个好处就是, 如果用左手尾指输入 `Shift` 键的话, 其他三个手指( 不含大拇指 ) 的长度去按数字键 1-5 刚好比较合适;

另外, `Ctrl` 键的使用频率也很高, 因此笔者打算将其放置到原来 `Shift` 键的位置上, 用左手小指控制; 巧合的是, `Ctrl` 键与数字键搭配的情况不多, 因此笔者觉得可以没有必要把它放到 home row 的位置上去;

当然, 以上只是笔者在真正调整键位前的臆想; 真正的效果如何还要等用过才知道;

##### 4. 系统设置
![Linux按键设置](https://blog.pytool.com/linux/linux-keycode-bindkey/)

这篇文章写得非常好, 简要清楚地解释了键盘按键工作的原理, 笔者试复述总结如下:

```mermaid
graph LR
  物理按键 --ScanCode--> 键盘驱动;
  键盘驱动 --KeyCode--> XServer;
  XServer --KeySym--> 上层应用;
```

这篇文章介绍的是修改 XServer 的方式, 来改变 KeyCode 和 KeySym 的对应关系;

首先终端下运行命令 `setxkbmap -print` 查看键盘方案, 输出如下:
```
xkb_keymap {
	xkb_keycodes  { include "evdev+aliases(qwerty)"	};
	xkb_types     { include "complete"	};
	xkb_compat    { include "complete"	};
	xkb_symbols   { include "pc+us+us:2+inet(evdev)"	};
	xkb_geometry  { include "pc(pc105)"	};
};
```

其中 xkb_symbol 一项告诉我们目前我们需要关心的文件, 而 `pc` 文件是辅助键的设置

我们运行命令 `sudo gedit /usr/share/X11/xkb/symbols/pc` 打开 ( **注意必须先备份** ) 这个文件

将对应项修改后, 保存, 退出——具体修改过程参考链接;

最后, 需要使所做的改动生效, 终端中运行命令: `sudo dpkg-reconfigure xkb-data` 

成功, 没有遇到什么 bug



