# vpm

vpm是一个v语言包管理工具，它用v编写而成。

vpm is a package manager written on V for V.

#### 前置条件(Precondition)

* `V`语言版本（`v0.1.13`）。
  `V` version `v0.1.13`.

* 安装`git`，因为目前包是通过`git clone`的方式下载的。
  Install `git` ,because the package is currently downloaded via `git clone`.
* 配置`VROOT`环境变量，内容指向v语言源码路径。
  Configure the `VROOT` environment variable, and the content points to the v language source path.

#### 安装(Install)

* 在任意目录下，`git clone https://github.com/yue-best-practices/vpm`
  In any directory, `git clone https://github.com/yue-best-practices/vpm`
* `cd vpm`
* 执行命令`v -prod .`即可编译出`vpm`可执行程序
  Execute the `v -prod .` command to compile the `vpm` executable.

#### 命令(Commands)

| 命令/Command   | 参数/Params               | 释义/Description                                             |
| :------------- | :------------------------ | :----------------------------------------------------------- |
| `-v`/`version` |                           | 版本信息，目前版本是`0.0.1`<br />Show version,the current version is `0.0.1` |
| `init`         | `<project-name>`          | 创建`.vpm.json`文件<br />Create the `.vpm.json` file         |
| `get`          | `<git-url>`  `<pkg-name>` | 从`<git-url>`中获取包。<br />Fetch package from the git repo. |
| `install`      |                           | 安装`.vpm.json`文件中的包。<br />Install the package from the `.vpm.json` file. |
| `-h`/`help`    |                           | 显示帮助信息。<br />Show help information.                   |
| `clean`        |                           | 删除`.vpm.json`文件。<br />Delete the `.vpm.json` file.      |
| `ls`           |                           | 显示已安装的包列表<br />Show installed packages list         |
| `rm`           | `<package-name>`...       | 按名称删除.vpm.json文件中的包<br />Remove packages in the .vpm.json file by name |