---
title: Wine安装与折腾
date: 2019-03-04 20:12:52
top:
mathjax:
category:
  - 手工实践
  - 装软件
tags:
comments:
---

记录下安装折腾 wine 的全过程，安装过程中遇到了问题，作为备忘；

参考网址为：[Ubuntu 系统上 Wine 安装](https://wiki.winehq.org/Ubuntu_zhcn)

<!-- more -->

接下来的步骤是按照上面官网链接的指示来做的：

#### 1. 开启 32bit 架构支持

```
sudo dpkg --add-architecture i386 
```

#### 2. 下载添加仓库密钥

```
wget -nc https://dl.winehq.org/wine-builds/winehq.key
sudo apt-key add winehq.key
```

#### 3. 添加仓库

```
sudo apt-add-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/bionic main'
```

#### 4. 更新安装包

```
sudo apt update
```

这前四步都非常顺利，没有遇到任何问题，如下图所示：

![001](/home/jackson/Blog/source/_posts/Wine安装与折腾/001.png)

{% asset_image 001.png %}

 

 

截止目前，一切都很顺列，但是接下来的一步就开始出问题了；

#### 5. 安装稳定版安装包

```
sudo apt install --install-recommends winehq-stable
```

弹出来的结果是

{% asset_image 002.png %}

![002](/home/jackson/Blog/source/_posts/Wine安装与折腾/002.png)

有一些未满足的依赖关系！

好，我们来看看官网上怎么说？

> 如果 apt-get 提示缺少依赖，请先安装缺少的依赖，然后重复以上两步（update 和 install）

#### 6. 在黑暗中摸索

首先尝试安装 libswresample2，反馈如下

{% asset_image 003.png %}

![003](/home/jackson/Blog/source/_posts/Wine安装与折腾/003.png)

这个意思应该是已经安装了这个包；

 

好，继续安装 libsoxr0，反馈如下

{% asset_image 004.png %}

![004](/home/jackson/Blog/source/_posts/Wine安装与折腾/004.png)

也已经安装了这个包



继续，尝试安装 wine-stable，反馈如下：

{% asset_image 005.png %}

![005](/home/jackson/Blog/source/_posts/Wine安装与折腾/005.png)

我去，翻天了！



忍着一口气继续尝试安装 wine-stable-amd64

{% asset_image 006.png %}

{% asset_image 007.png %}

![006](/home/jackson/Blog/source/_posts/Wine安装与折腾/006.png)

![007](/home/jackson/Blog/source/_posts/Wine安装与折腾/007.png)

OK，成功安装了！再尝试一下使用 `sudo apt install wine-stable`命令安装

{% asset_image 008.png %}

![008](/home/jackson/Blog/source/_posts/Wine安装与折腾/008.png)

依赖项果然少了，amd64 后缀包成功安装了

于是我们继续尝试安装 `wine-stable-i386`

{% asset_image 009.png %}

{% asset_image 010.png %}

{% asset_image 011.png %}

![009](/home/jackson/Blog/source/_posts/Wine安装与折腾/009.png)

![010](/home/jackson/Blog/source/_posts/Wine安装与折腾/010.png)

![011](/home/jackson/Blog/source/_posts/Wine安装与折腾/011.png)



老子现在彻底无语了……

于是上 google 查，查到了不少与我遇到相似问题的人，可是这些网页里的解决方案我基本都看不懂，一头雾水。

#### 7. 问题解决

活马当死马医，用关键词 “无法修正错误，因为您要求某些软件包保持现状，就是它们破坏了软件包间的依赖关系” 在 google 上搜索，结果搜到的帖子给出的解决方法竟然如出一辙：是源的问题。

其中一个搜索结果：[E:无法修正错误,因为您要求某些软件包保持现状,就是它们破坏了软件包间的依赖关系](https://www.cnblogs.com/LeoGodfrey/p/3316834.html)

然后按照帖子的说法，把 软件与更新 中 “更新” 选项卡的 “从下列地点安装更新” 的两个勾选上；

{% asset_image 012.png %}

![012](/home/jackson/Blog/source/_posts/Wine安装与折腾/012.png)

回到终端里面，使用一开始的安装命令进行安装，发现可以安装啦！！！！

{% asset_image 013.png %}

{% asset_image 014.png %}

{% asset_image 015.png %}

{% asset_image 016.png %}

{% asset_image 017.png %}

{% asset_image 018.png %}

{% asset_image 019.png %}

{% asset_image 020.png %}

{% asset_image 021.png %}

{% asset_image 022.png %}

{% asset_image 023.png %}

{% asset_image 024.png %}

{% asset_image 025.png %}

![013](/home/jackson/Blog/source/_posts/Wine安装与折腾/013.png)

![014](/home/jackson/Blog/source/_posts/Wine安装与折腾/014.png)

![015](/home/jackson/Blog/source/_posts/Wine安装与折腾/015.png)

![016](/home/jackson/Blog/source/_posts/Wine安装与折腾/016.png)

![017](/home/jackson/Blog/source/_posts/Wine安装与折腾/017.png)

![018](/home/jackson/Blog/source/_posts/Wine安装与折腾/018.png)

![019](/home/jackson/Blog/source/_posts/Wine安装与折腾/019.png)

![020](/home/jackson/Blog/source/_posts/Wine安装与折腾/020.png)

![021](/home/jackson/Blog/source/_posts/Wine安装与折腾/021.png)

![022](/home/jackson/Blog/source/_posts/Wine安装与折腾/022.png)

![023](/home/jackson/Blog/source/_posts/Wine安装与折腾/023.png)

![024](/home/jackson/Blog/source/_posts/Wine安装与折腾/024.png)

![025](/home/jackson/Blog/source/_posts/Wine安装与折腾/025.png)

中途省略了一部分，没有截图……

然后笔者输入命令 `wine -v`本意欲查看版本号，结果又自动开始安装 wine-gecko：

{% asset_image 026.png %}

![026](/home/jackson/Blog/source/_posts/Wine安装与折腾/026.png)

最后输入命令 `wine --version`成功取得版本号：

{% asset_image 027.png %}

![027](/home/jackson/Blog/source/_posts/Wine安装与折腾/027.png)



目前看来，wine 终于安装成功了，告一段落，心累……