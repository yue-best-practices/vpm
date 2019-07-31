# vpm
**注意**: 目前V(0.1.17)版本构建此项目失败

[issues](https://github.com/vlang/v/issues/1390)

vpm是一个v语言包管理工具，它用v编写而成。

#### 前置条件

* `V`语言版本（`v0.1.13`）。
* 安装`git`，因为目前包是通过`git clone`的方式下载的。
* 配置`VROOT`环境变量，内容指向v语言源码路径。

#### 安装

* 在任意目录下，`git clone https://github.com/yue-best-practices/vpm`
* `cd vpm`
* 执行命令`v -prod .`即可编译出`vpm`可执行程序

#### 命令

| 命令   | 参数                       | 释义                                                                 |
| :------------- | :------------------------ | :-----------------------------------------------------------|
| `-v`/`version` |                           | 版本信息，目前版本是`0.0.1`                                    |
| `init`         | `<project-name>`          | 创建`.vpm.json`文件                                          |
| `get`          | `<git-url>`  `<pkg-name>` | 从`<git-url>`中获取包。                                       |
| `install`      |                           | 安装`.vpm.json`文件中的包。                                   |
| `-h`/`help`    |                           | 显示帮助信息。                                                 |
| `clean`        |                           | 删除`.vpm.json`文件。                                         |
| `ls`           |                           | 显示已安装的包列表                                             |
| `rm`           | `<package-name>`...       | 按名称删除.vpm.json文件中的包                                   |
