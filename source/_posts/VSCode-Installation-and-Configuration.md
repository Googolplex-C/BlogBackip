---
title: VSCode Installation and Configuration
date: 2019-01-13 16:35:19
top:
mathjax: 
category:
  - 手工实践
  - 配环境
tags:
comments:
---

Ubuntu 环境下安装配置 VSCode

<!-- more -->

为了在 Linux 环境下进行 C/C++ 程序的编写，笔者决定配置相关的程序开发环境，最终决定选用 VSCode + GCC 的搭配。

由于笔者水平极为有限，因此本文之只作为安装和配置过程中的记录，以供后续查看和捋清思路之用。

#### 1. 安装必要的编译器套装

​	据笔者所知（虽然不知道是什么时候听闻的）LInux 系统与 C/C++ 语言本身关系密切，且笔者某位朋友也曾提及过 Linux 环境下 C/C++ 环境的配置很顺畅，甚至于 GCC 本身是 Linux 某些发行版自带的。

​	但由于笔者在安装 Ubuntu 时选择了最小安装选项，所以一开始在 terminal 下输入 gcc 显示找不到命令，笔者推测此时系统并未安装 gcc 编译套装。

​	查找网络后，决定采用较为简单的方法：安装 build-essential 包，据说此包已包含许多 C/C++ 语言开发的必要编译包。

```
sudo apt-get install build-essential
```

 	安装完成后，多出了许多包，看起来很恐怖，也不知道具体是什么包，忽略之。

​	**值得注意的是**：

​	在安装 build-essential 包的时候，提示将安装的包中并没有 glibc 这个包，而这个包据说是非常重要和基础的一个C 库，运行命令：

```
dpkg -l
```

不能看到 glibc 这个包的存在。但使用网上的查看 glibc 的方法是可以看到其版本的……

​	**目前无法解决此疑问，也没有搞清诸如 libc，libc++，glibc 这些概念的关系**

#### 2. 安装VSCode

​	这一步骤非常简单，直接在 VSCode 的首页上下载 .deb 包安装即可。

#### 3. 安装必要插件

​	截至 2019.01.13，安装了四个插件：

- C/C++ 
- YAML 安装这个包是因为我的博客的许多配置文件据说是用 YAML 格式写的，与 C/C++ 本身好像没有什么关系
- Chinese (SImplified) Language Pack 这个是简体中文语言包
- Code Runner 这个包据说能提供一键运行的功能（我注意到 VSCode 没有传统的 IDE 中的 “构建“ 菜单）





！！但目前配置应该还没有结束，因为许多网上的教程进行到这一步还没有结束。







