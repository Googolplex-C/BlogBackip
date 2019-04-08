---
title: VSCode Snippet Configuration
date: 2019-03-26 20:08:38
top:
mathjax:
category:
  - 手工实践
tags:
  - Snippet
  - 快捷键
  - 个性化设置
  - 编程环境
comments:
---

日常折腾，为了更流畅地在电脑上写数学公式和博文。

<!-- more -->

### 一、为什么要折腾
尽管之前已经在笔者本人的 Ubuntu 系统上进行了键位映射，但是写博文的时候依然非常不顺手，输入速度很慢，尤其是带有 LaTeX 公式的时候，此外写一般的代码时候也没有训练打字时顺畅。

### 二、从哪里得到的启发
在知乎的一篇帖子 [1700页数学笔记火了！全程敲代码，速度飞快易搜索，硬核小哥教你上手LaTeX+Vim](https://zhuanlan.zhihu.com/p/60049290) 中，介绍了一位小哥使用 LaTeX + Vim，在课堂上记下了 1700 多页数学笔记，其中提到了一个编辑器的特性叫做 Snippet，可以通过输入关键词直接插入设定好的代码片段，尽管笔者没有使用过、也不会用 Vim，但是这个 Snippet 特性还是令笔者非常感兴趣，当时笔者就是从此处受到了启发。

### 三、为什么会慢
1. 代码中含有大量的符号
2. 笔者暂时还没有开始练习非英文键区的标准指法；
3. 即便训练了非英文键区的标准指法，数字区和符号区的键位也离手指更远，因此相比起字母键区的键位，输入节奏必然有别，输入速度必然也更慢

### 四、理想的快捷输入
1. Snippet 中已经包含代码中繁杂的符号，不需要再手动输入
2. 作为输入者，只需（或者最大程度地只需）输入真正的会显示出来的内容（主要就是字母串）
3. 在使用快捷输入的时候，功能键必须尽可能地靠近字母区；
4. 快捷输入最好可以嵌套使用

### 五、Snippet 和 Shortcut 设置
VSCode 已经自带了 Snippet 功能，尽管功能不如 Vim 上的插件，并且有一定的缺陷，但基本还是满足使用要求的，笔者在 CSDN 上找到一篇博文，其内容是 VSCode 文档中 Snippet 部分的翻译和整理。笔者就不在此赘述 VSC 中 Snippet 的基本语法和概述了。

[[VS Code]跟我一起在Visual Studio Code 添加自定义snippet（代码段），附详细配置](https://blog.csdn.net/maokelong95/article/details/54379046)

#### 更改触发快捷键
snippet 的本质是输入一个作为口令的单词（vscode里称为 prefix）之后，通过设定好的快捷键触发功能，然后将prefix替换为预设好的内容

1. 设置 `"editor.tabCompletion": "on"`，这一步严格来说开启的是自动补全，和真正意义上的插入 snippet 是不一样的

2. 设置
```
    {
        "key": "shift+space",
        "command": "editor.action.insertSnippet"
    }
```
这个应该才是真正意义上地触发 snippet 的命令；

其他快捷键保持不变；

#### 自定义 prefix
由于笔者最近一段时间几乎只用 VSCode 写博客，因此优先考虑 LaTeX 和 Markdown 的输入。

同时，考虑到 LaTeX 公式也会在 Markdown 中出现，因此笔者将 LaTeX 命令的 Snippet 放到全局 Snippet 文件中，但是将 scope 关键字设为：LaTeX，Markdown

具体的设置如下：
```JSON
{
	// latex 数学环境输入基本要素：定界符
	"Inline maths formula delimiter": {
		"scope": "markdown,latex",
		"prefix": "fi",
		"body": "$$1$ $0",
		"description": "the delimiter of inline maths"
	},
	"Display maths formula delimiter": {
		"scope": "markdown,latex",
		"prefix": "fd",
		"body": ["$$",
			"$1",
			"$$\n",
			"$0",
		],
		"description": "the delimiter of diaplay maths"
	},

	// latex 公式环境以及编号、引用等宏
	"formulas environment": {
		"scope": "markdown,latex",
		"prefix": "fev",
		"body": [
			"\\begin{${1|equation,equation*,align,align*,gather,gather*,flalign,flalign*|}}",
			"$2",
			"\\end{${1|equation,equation*,align,align*,gather,gather*,flalign,flalign*|}}$0",
		],
		"description": "the formulas environment"
	},
	"reference and tags of formulas": {
		"scope": "markdown,latex",
		"prefix": "ftr",
		"body": ["${1|\\ref,\\tag,\\tag*,\\label|}{$2}$0"],
		"description": "reference and tags of formulas"
	},

	// latex 内嵌公式环境
	"formulas inside environment": {
		"scope": "markdown,latex",
		"prefix": "fiev",
		"body": [
			"\\begin{${1|gathered,split,aligned|}}",
			"$2",
			"\\end{${1|gathered,split,aligned|}}$0",
		],
		"description": "the formulas inside environment"
	},
	
	// latex 矩阵环境
	"environment of matrix": {
		"scope": "markdown,latex",
		"prefix": "fmt",
		"body": [
			"\\begin{${1|matrix,pmatrix,bmatrix,vmatrix,Vmatrix,Bmatrix|}}",
			"$2",
			"\\end{${1|matrix,pmatrix,bmatrix,vmatrix,Vmatrix,Bmatrix|}}$0",
		],
		"description": "environment of matrix"
	},

	// latex 基本宏命令快捷输入
	"Slash1": {
		"scope": "markdown,latex",
		"prefix": "jj",
		"body": "\\\\$1{$2}$0",
		"description": "Slash1",
	},
	"Slash2": {
		"scope": "markdown,latex",
		"prefix": "jk",
		"body": "\\\\$1{$2}{$3}$0",
		"description": "Slash2",
	},
	"Slash3": {
		"scope": "markdown,latex",
		"prefix": "jl",
		"body": "\\\\$1{$2}{$3}{$4}$0",
		"description": "Slash3",
	},

	// latex 公式基本结构：上下标
	"superscript and subscript": {
		"scope": "markdown,latex",
		"prefix": "gg",
		"body": "$1_{$2}^{$3}$0",
		"description": "superscript and subscript"
	},

	// latex 括号快捷输入
	"parenthesis": {
		"scope": "markdown,latex",
		"prefix": "ff",
		"body": "($1)$0",
		"description": "parenthesis"
	},
	"brace": {
		"scope": "markdown,latex",
		"prefix": "dd",
		"body": "\\{$1\\\\}$0",
		"description": "brace"
	},
	"bracket": {
		"scope": "markdown,latex",
		"prefix": "ss",
		"body": "[$1]$0",
		"description": "bracket"
	},

	// latex 常用函数,公式或表达式
	"sqrt formulas": {
		"scope": "markdown,latex",
		"prefix": "fsq",
		"body": "\\sqrt[$1]{$2}$0",
		"description": "sqrt formulas"
	},

	"general fraction": {
		"scope": "markdown,latex",
		"prefix": "fgfr",
		"body": "\\genfrac{$1}{$2}{$3}{$4}{$5}{$6}$0",
		"description": "general fraction"
	},
	"fraction": {
		"scope": "markdown,latex",
		"prefix": "ffr",
		"body": "\\frac{$1}{$2}$0",
		"description": "fraction"
	},
	"binomial coefficient": {
		"scope": "markdown,latex",
		"prefix": "fbi",
		"body": "\\binom{$1}{$2}$0",
		"description": "binomial coefficient"
	},
	"lists": {
		"scope": "markdown,latex",
		"prefix": "flt",
		"body": "$$1$, $$2$, $$3$, $\\ldots$, $$4$$0",
		"description": "binomial coefficient"
	},
}

```
以及专门面向 Markdown 的 prefix：

```JSON
{
	// 数学证明结束语
	"End of proof": {
		"prefix": "qed",
		"body": [
			"<p align=\"right\">Q.E.D.</p>",
			"$0"
		],
		"description": "End of proof",
	},

	// 插入图片（针对Hexo）
	"Insert image": {
		"prefix": "iimg",
		"body": [
			"{% asset_image $1.$2 %}",
			"$0"
		],
		"description": "Insert image",
	},

	// 注释
	"Comments": {
		"prefix": "cmt",
		"body": [
			"<!--...-->",
			"$0",
		],
		"description": "Comments",
	},

	// html 标签字体颜色
	"Fonts style": {
		"prefix": "sty",
		"body": [
			"<font color=\"$1\" size=\"$2\"> $3 </font>$0",
		],
		"description": "Comments",
	},

	// 居中
	"Center": {
		"prefix": "ctr",
		"body": [
			"<center> $1 </center>$0",
		],
		"description": "Center",
	},
}
```

**需要注意的是：如果需要定义一个 `\[content]` 的内容，即`\\` 后面接的是符号 `$`，那么在JSON 中不能写成 `\\$1`，笔者专门在网上搜查过，JSON 会经过两次转义（其实笔者自己也不太清楚内部的原理），因此，必须写成 `\\\\$1` 的形式。**

#### 定义方向键快捷键
方向键也是非常常用的键位，但是它们离主键区实在太远了，笔者将 `ctrl+;` 设为 Rightarrow 和 Downarrow，`ctrl+‘`设为 Leftarrow 和 Uparrow；其中当编辑器处于文本聚焦（也就是光标在闪可以输入文字的状态）时，它们相当于左右箭头，其他情形下相当于上下箭头。

```JSON
[
    {
        "key": "ctrl+'",
        "command": "cursorLeft",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+'",
        "command": "history.showPrevious",
        "when": "historyNavigationEnabled && historyNavigationWidget"
    },
    {
        "key": "ctrl+'",
        "command": "list.focusUp",
        "when": "listFocus && !inputFocus"
    },
    {
        "key": "ctrl+'",
        "command": "notifications.focusPreviousToast",
        "when": "notificationFocus && notificationToastsVisible"
    },
    {
        "key": "ctrl+'",
        "command": "outline.focusUpHighlighted",
        "when": "outlineFiltered && outlineFocused"
    },
    {
        "key": "ctrl+'",
        "command": "selectPrevSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "ctrl+'",
        "command": "showPrevParameterHint",
        "when": "editorTextFocus && parameterHintsMultipleSignatures && parameterHintsVisible"
    },
    {
        "key": "ctrl+'",
        "command": "workbench.action.interactivePlayground.arrowUp",
        "when": "interactivePlaygroundFocus && !editorTextFocus"
    },
    {
        "key": "ctrl+;",
        "command": "breadcrumbs.selectFocused",
        "when": "breadcrumbsActive && breadcrumbsVisible"
    },
    {
        "key": "ctrl+;",
        "command": "cursorRight",
        "when": "textInputFocus"
    },
    {
        "key": "ctrl+;",
        "command": "history.showNext",
        "when": "historyNavigationEnabled && historyNavigationWidget"
    },
    {
        "key": "ctrl+;",
        "command": "keybindings.editor.focusKeybindings",
        "when": "inKeybindings && inKeybindingsSearch"
    },
    {
        "key": "ctrl+;",
        "command": "list.focusDown",
        "when": "listFocus && !inputFocus"
    },
    {
        "key": "ctrl+;",
        "command": "notifications.focusNextToast",
        "when": "notificationFocus && notificationToastsVisible"
    },
    {
        "key": "ctrl+;",
        "command": "outline.focusDownHighlighted",
        "when": "outlineFiltered && outlineFocused"
    },
    {
        "key": "ctrl+;",
        "command": "selectNextSuggestion",
        "when": "suggestWidgetMultipleSuggestions && suggestWidgetVisible && textInputFocus"
    },
    {
        "key": "ctrl+;",
        "command": "settings.action.focusSettingsFile",
        "when": "inSettingsSearch && !suggestWidgetVisible"
    },
    {
        "key": "ctrl+;",
        "command": "settings.action.focusSettingsFromSearch",
        "when": "inSettingsSearch && !suggestWidgetVisible"
    },
    {
        "key": "ctrl+;",
        "command": "showNextParameterHint",
        "when": "editorTextFocus && parameterHintsMultipleSignatures && parameterHintsVisible"
    },
    {
        "key": "ctrl+;",
        "command": "workbench.action.interactivePlayground.arrowDown",
        "when": "interactivePlaygroundFocus && !editorTextFocus"
    },
]
```
至此，设置就全部结束了

### 六、曾经遇到的坑，以及不完善的地方
1. 如何在一个 snippet 中快捷地输入一个嵌套的 snippet：

    笔者做过非常多的尝试，最后仍然没有达到想要的效果

    在笔者的 VSCode 上，单纯地把 `tabCompletion` 设为 `on`的话，快捷键是这样的：

	- 输入 prefix，按 `tab`，自动插入 snippet
	- 按 `tab` 可以不断地跳转到 snippet 中设定好的 tabstop 位置，直到结束

	于是，如果设定好了一个至少一个 topstop 的 snippet的话，在 tabstop 当中如果想要继续通过 `tab` 来插入嵌套的 snippet 是做不到的

	笔者为了解决这个问题是费了许多功夫：

	1. 一开始笔者以为控制 `tab` 输入 snippet 的是命令 `insertSnippet`，于是笔者将触发条件中的 `!inSnippetMode` 去掉，无果；
	2. 后来笔者发现即使是在 snippet 的 tabstop 中，可以通过 `ctrl+tab` 快捷键触发 suggestion，然后用 `tab` 选择，但这样就多了一部操作，显得很繁琐
	3. 于是笔者将 这个快捷键的触发条件 复制到 insertSnippet 中，依然无效
	4. 仍不死心，后来发现控制这一行为的应该是 `insertBestCompletion` 这一命令；尝试修改之，无果；
	5. 在 VSC 的 github issue 上也找到了一些嵌套 snippet not working 的帖子，有人说要修改 `editor.suggestion.snippetPreventQuickSuggestion` 这一项，但好像没有什么变化；
	6. 笔者还发现 `insertSnippet` 这一命令好像是不起作用的，设置什么快捷键都不会触发其效果

	中途笔者使用了一段时间的 `shift+space` 触发建议小窗口后（原快捷家是 `ctrl+space`） 使用 `tab` 选中的方式，但是这方法除了比较麻烦之外，还必须要求 prefix 是单独的单词，不能和前后的内容连在一起，否则不会触发；
	
	最后笔者将 命令`editor.action.insertSnippet`（这个才能真正其作用，但依然是弹出一个窗口）的快捷键设为 `shift+space`，输入 prefix 后 `enter`选中，；而建议小窗口的快捷键换回 `ctrl+space`，虽然也要两步，但是可以在任何时候插入 snippet。

2. 退出snippet mode 的问题

	在 snippet 的 tabstop 中，为了显示现在处于 tabstop 中，输入的时候是带有阴影的；

	笔者不希望进入这个snippet mode 之后太难或者太容易就推出这种状态：前者有时候会增添麻烦，后者会使得在 tabstop 处使用一些功能键的时候（比如 `ctrl+v`）直接推出，影响节奏；

	最后发现，有几种情况会退出 snippet mode：

	1. `Esc` 或者 `Shift+Esc`
	2. `Tab` 进入下一个 tabstop
	3. 光标移出 tabstop 的位置
	
#### 不完善的地方
1. prefix 本身必须是固定的，不能支持正则表达式等
2. snippet 嵌套问题
3. 




