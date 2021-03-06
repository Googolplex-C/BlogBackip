---
title: Automatical terminal record
date: 2019-05-19 22:07:49
top: 
mathjax: true
category:
  - 手工实践
tags:
  - Ubuntu 系统
comments:
---

笔者写了一个简单的小脚本，用于自动记录 ubuntu/linux 系统中的终端的输入输出。
现将代码以及实现思路记录于此。

<!-- more -->
# 场景与需求
在 linux 系统下，使用终端是几乎不可避免的，而且对于 linux 而言，命令行才应该是打开 linux 的 “正确方式”；而在命令行下操作，总免不了与天书般的命令、深奥晦涩的输出和提示打交道，时间一久，很容易忘记曾经在命令行下进行过什么操作，并得到什么输出；

能够记录下曾在命令行下发生的一切事情非常有利于日后的排查和整理，而且大多数的发行版（当然，不包括 ArchLinux 这类）也已经提供了一个现成的命令 `script`，用于记录终端下的输入输出。然而，这依然不是我们理想中的解决方案，因为我们必须在写入终端之前，调用 `script` 命令——不难，但很繁琐，且分散注意力（相信我，你在急匆匆打开一个终端往里面输东西的时候——比如在配环境这种令人烦躁的时刻，根本不会记得这种事情）

我们要让工具适应人，而非反其道而行之。

我们不妨大胆地设想一个一个理想的终端记录功能/记录器应有的样子：

1. **每次**打开终端，都可以**自动**记录
2. **每次**关闭终端的时候，此次打开终端的所有输入输出都可以**自动保存**，而不需要手工地进行一次保存操作
3. 应该明确告知用户目前是否处于自动记录状态
4. 记录下的文件按照一定的规则进行保存整理，方便以后查看翻阅


# 源代码

整个脚本只有一段源代码，如下所示：

```sh
# automatically record user's terminal - BY JACKSON
PS1_bak=${PS1}
PS1="(logging)"${PS1}

if [ $SHLVL -le 1 ];
then

    ADDRESS=~/sysconfig/tmlog/
    ARCHIVE=${ADDRESS}"archives"

    if [ ! -d ${ARCHIVE} ]; then
        mkdir -p ${ARCHIVE}
    fi

    titledate=`date "+%F-%u-%H%M%S"`

    # DEBUG
    #cat ${ARCHIVE}/${titledate}.tm

    script -f -q -a -t 2>${ARCHIVE}/${titledate}.tm ${ARCHIVE}/${titledate}.log

    PS1=${PS1_bak}
fi

alias lgd="cd ~/sysconfig/tmlog/archives"
# BY JACKSON
```

# 使用方式
非常简单，只需要复制这段源代码，然后在 `/home/${USER}/` 目录下的 `.bashrc` 文件中的最后一段粘贴添加并保存即可。

> ${USER} 就是当前的用户名

# 思路解释、特性和难点
## shell类型
关于 shell 的类型，一般而言有两个维度来衡量：交互式与非交互式，登录与非登录，这两个维度可以组合出四种类型的 shell

### 交互式与非交互式
交互式 shell，故名思义，就是 shell 等待用户的输入，然后执行输入的命令，最后将执行结果输出在屏幕上；就好似 shell 和用户对话一般，这就是交互式 shell。

那么，非交互式 shell 就很容易理解了，这种类型的 shell 并不会将用户视作交互的对象，而是默默地执行命令，命令多数包含在文件中作为一整个脚本运行，即使有输出或者输出，也不是直接打印在屏幕上，而往往会输出到别的地方（比如文件）

### 登录与非登录
这对概念范畴相对来说比较难理解，笔者查阅过网络上不少资料，在此试着阐述一下自己的理解。

凡是你打开一个终端，被告知输入用户名和密码的终端，就是登录式终端；而凡是不需要提供这些的，就是非登录式终端。

请注意，在图形界面打开的终端（实际上是终端模拟器）是**非登录** shell。

## 自动运行
如果我们需要让一个 shell 在打开的时候自动运行某些命令，我们应该去关注 bash 的初始化文件；类似于面向对象范式编程语言中，类的构造函数一样，这些初始化文件会在某些时候（主要指的是 bash 打开或者登录 shell 的时候）执行一些命令，完成关于 shell 的初始化配置。

1. 系统级别的初始化文件：

    这种类型的文件中的配置是面向系统所有用户的，一般位于 `/etc` 目录中

2. 用户级别的初始化文件：

    面向的是单个用户

我们不在此列举各个初始化文件，那样只会显得罗嗦和繁琐；最终笔者发现在用户家目录下的 `.bashrc` 文件可以提供我们需要的特性

1. 交互式、non-login shell 在**每次**打开的时候都会读取执行这个文件；
2. 交互式、login shell 一般会读取 `~/.bash_profile` 这个文件，而它往往又会读取并执行 `.bashrc` 文件

非常符合我们的需求，所以我们就在此处添加脚本代码。

## 不要踩坑：有关循环调用的问题
在 linux 命令 `script` 的 manual 中，提及到了这样一句话：

> the inner shell of script is always interactive, and this could lead to unexpected results.  If you use script in the shell initialization file, you have to avoid entering an infinite loop.

意思就是说 script 命令执行后，其应该是 fork 了一个新的交互式 bash shell 出来（尽管除了能够记录输入输出之外，其他地方看上去并没有什么区别），关键在于这个 inner shell 也是交互式的——这将导致循环调用。

如果我们直接在 `.bashrc` 文件后面简单添加一行命令 `script [-option] [file]` 的话，那么在我们打开一个交互式、non-login 的 bash shell 的时候，会执行 `.bashrc` 中的命令——当然也包括 `script` 命令；

而正如上所述，`script` 命令本身也会 fork 一个新的交互式 shell（同时也是非登录式的，因为它从未要求输入用户名和密码），那么这个新一层调用的 shell 也会执行 `.bashrc` 中的内容（注意，`.bashrc` 中的内容是每次打开对应类型的 bash shell 时都会执行的），那么会在这个新 fork 出来的 shell 中再一次执行所有包含在内的命令——自然，也会再一次执行文件末尾的 `script` 命令。

于是，死循环调用就这样产生了。

为了避免这种问题的产生，我们几乎只有一种解决的思路（受水平所限，笔者无法深入 shell 或者 `script` 命令的内部去做修改），那就是：**让 `script` 命令只调用执行一次**

经过一定时间的查找，笔者发现在 linux 系统中有一个环境变量 `SHLVL`，意为 " Shell Level"，它的值表示当前 shell 处于调用层级的第几层，如一开始打开一个 bash shell，在此 shell 中变量 SHLVL 的值为 $1$，调用一次 `script` 之后，在窗口中显示此环境变量的值则为 $2$，以此类推。

因此，笔者所写的源代码具有这样的结构：
```
// do something

if [$SHLVL -le 1];
then

    // do something related to scripts logging
    script [-option][file]

fi
```

如此，在第一次调用 `script` 命令的时候，新 inner shell 同样也会读取执行 `.bashrc` 文件，但在执行到 `script` 所在的部分时，会因为不满足 `$SHLVL -le 1` 的条件而跳过，从而避免了循环调用的问题。

### child shell and subshell, any difference?
在查阅环境变量 `SHLVL` 的时候，笔者得知两个相近但不同的概念：child shell 和 subshell。

在一个 bash 里面调用另一个 bash（比如 `script`）会新增一层 child shell 调用，而环境变量 `SHLVL` 记录的正是 bash 进程嵌套深度——对应地，另一个环境变量 `BASH_SUBSHELL` 记录一个 bash 进程中多个 subshell 的嵌套深度，但我们此处无需用到。

## 特性：无需手动保存
在笔者的需求设想中，脚本除了使 bash 一打开就自动进行记录之外，还无需在退出前输入 `exit` 退出 `script` bash shell 进程就能自动将终端记录保存至文件。

为了实现这一特性，笔者想到了两种思路：

第一种思路，就是在终端退出前自动执行 `exit` 命令；
笔者经过查阅，得知有一个名为 `.bash_logout` 的文件，但它是针对登录 shell 的，在 logout 之前自动执行文件中的命令；

另外，stackexchange 上也有一些相似的问题，其主要思路是捕获 bash shell 退出的 signal，被此 signal 触发后执行一段命令；但问题在于，这种方法只针对的在 bash 中使用命令（如 `exit` 等）退出的情形；如果在图形界面直接用鼠标点击关闭终端模拟器，类似与直接杀死进程，和使用命令退出是两回事，而很多时候我们都往往会用后者关闭终端模拟器——如果都用到 `exit` 退出终端了，还会介意用 `exit` 退出 `script` 么？然而直接鼠标点击关闭时，这种方法不会起奏效。

幸好，`script` 命令本身提供了 `-f/--flush` 参数，顾名思义，这个参数使得 `script` 命令在其 inner shell 的**每次**写入之时，都**同时**将内容写入文件（如果不加这个参数，那么默认在使用 `exit` 退出 `script` shell 时一次性保存）——这个参数选项的存在，不仅使得直接达到 “无需手动保存” 的要求，从某种意义上说，比原先的要求还更进一步：即使我们做到每次退出前自动保存，但难免会出现非正常退出的情形，这种情形下实时写入文件保存至少仍能最大程度地保留终端交互的内容。

### 注意：不能在 script inner shell 中直接回放该 shell 已保存的交互内容
实时 flush 从另一方面，要求我们不能在打开一个 script shell 而未退出时，直接使用 `scriptreplay` 或者 `cat` 等命令对这同一个 inner shell 已经保存的内容进行回放——这将导致无限读写循环。

我们试以一个例子说明之。

假设我们已经执行 `script` 命令：

1. 进行一次交互式输入输出，交互内容记为 $P$，同时 $P$ 被写入文件；
2. 不退出当前 inner shell，直接回放当前 shell 对应记录文件中的内容；
3. $P$ 作为回放输出呈现在屏幕上，由于 **`script` 会将终端所有内容记录下来，并且 `--flush` 选项会在每次交互时同步写入文件**，因此，$P$ 会再次被保存到文件中
4. 此时回放程序读取到的位置刚好是第二部中调用回放程序自身的时刻，它会继续向下读取，把 $P$ 的第一次回放所留下的记录又一次回放出来，而本次回放将依然记录到文件中去；

于是，内容 $P$ 的每一次回放都会作为输出内容被保存到文件中去（而且是在原有内容上追加），从而作为后续的回放内容再次输出——这就成了一个死循环。

因此，为了避免循环输出，在需要翻看从前的 script log 时，**请一定记得退出 script 本身，并在原来底层的 bash shell 进程中使用其他回放程序查看** 


## 终端提示符修改
受 Anaconda 的启发，笔者也想对终端提示符进行配置，使其能够提示用户当前是否处于 `script` 命令的 shell 中（正如上一小节所述，用户如果要调阅之前的记录，需要在底层的 bash shell 中查看，如果可以直接根据终端提示符来判断会更加方便）

可以通过修改环境变量 `PS1` 的内容，来修改终端提示符——并且随着变量 `PS1` 的值的改变，提示符也会**实时**改变；

笔者的脚本中关于终端提示符的流程逻辑如下：
```
// action1: modify the terminal prompt

if [ $SHLVL -le 1 ];

then
    script [-option][file]
    // action2: restore the terminal prompt
fi
```

1. 第一次打开终端：

    - bash shell 自动执行 `.bashrc`， 至 action1 处底层 bash 提示符添加 "logging" 标识；
    - 执行 `script` 命令，inner shell 内样执行 `.bashrc`，inner bash 同样添加 "logging" 标识；
    - 执行 `exit` 命令，inner shell 进程结束，返回至底层 shell；
    - 底层 shell 的 `.bashrc` 文件此时未执行完毕，而是执行至 action2 命令，此时将提示符 "logging" 标识去掉，恢复原样；

2. 退出 script shell 后再次调用 `script` 命令

    - 如前所述，**第一次退出** script shell 后，底层 bash shell 的提示符已经没有 "logging" 标识；
    - 再次调用 `script` 命令，自动执行 `.bashrc` 脚本至 action1 处， inner shell 提示符添加 "logging" 标识；
    - 第二次退出 script shell，回到底层 bash shell，提示符呈现无标识状态

就这样，第一次调用退出，和之后的调用退出，流程逻辑略有不同，但结合在一起就可以实现相同的 “记录时则有标识，不记录则无标识” 的提示效果；

## 记录档案保存规则
字符文件和时间轴文件按照日期时间命令，存储在指定目录 `ARCHIVE` 中；

注意，日期时间精确到秒，因此，排除一次性同时打开两个终端的情况——每一次打开终端都会生成单独的两个记录文件

为什么要精确到秒，请看下一节

# 待续：未完善之处
## 时间轴文件的追加问题，以及当前所采用的取巧解决方法
如果您仔细阅读笔者的源代码，您会发现脚本的核心代码如下：
```sh
script -f -q -a -t 2>${ARCHIVE}/${titledate}.tm ${ARCHIVE}/${titledate}.log
```
`-f` 的含义上面已经解释，`-q` 表示记录时静默，`-a` 表示如果待写入的目标文件已经存在则在文件末尾追加记录（而非覆盖），`-t` 以及后面的重定向输出表示记录并保存交互内容的时间轴；

一切看上去都很美好，但是……

在笔者一开始的设想中，记录文件是按照日期生成的——可以预见的是，一天之内，肯定不止一次打开终端，因此也就是说，一天之内，我们需要多次调用 `script` 命令往同一个文件（准确说是两个文件，字符和时间轴）中写入，因此在代码中才特意加上 `-a` 选项；

但问题就是，这个选项只对字符文件有效，而在记录时间轴的文件在每次重新调用 `script` 时原有的内容会被覆盖。

笔者找了许多方法也没有正面解决时间轴输出覆盖的问题；因此，之所以前面笔者强调记录文档的生成需要精确到 秒，正是绕开了文件追加的问题采取的取巧折中的办法——当然前提是，一次性只打开一个终端，正好符合笔者的操作习惯


## 记录多个同时打开的终端？
继续上面的讨论，笔者在撰写这篇博文之前，得到过一位优秀的朋友兼师弟的提议。他说他自己平时使用终端的习惯是同时打开多个终端进行不同的任务，因此他建议笔者继续改进，以实现可以记录多个终端交互内容的功能——这目前还未能做到。

不过，由于时间精力所限，这件事恐怕得放到以后了。


以上。