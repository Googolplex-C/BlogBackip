---
title: OED installation
date: 2019-03-04 12:33:06
top:
mathjax: 
category:
  - 手工实践
  - 软件安装
tags:
  - 英语词典
comments:
---

安装 Oxford English Dictionary，过程不难，记录如下

<!-- more -->

##### 安装包来源

magnet:?xt=urn:btih:98F95B2DA4380A0231109F8CFDB6E5AB0E48C2EA

挺老的资源，但是健康度还是挺好的，在 Ubuntu 上使用 qBIttorrent 下载一晚上就安装好了；

##### 安装

下载得到是一个压缩包，里面是需运行在 Windows 系统上目录（主程序是exe），无需安装；

##### 问题

打开主程序，提示找不到 MSVCR71.dll

##### 解决

1. 在网上下载 32bit 的 MSVCR71.dll，放置在 C:/windows/sysWOW64 目录下，无需通过名命令行注册；

2. 根据原网页的提示，将目录名字改为 "Oxford English Dictionary"；

问题成功解决，可以正常运行主程序。

