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

| 命令/Command   | 参数/Params                  | 释义/Description                                             |
| :------------- | :--------------------------- | :----------------------------------------------------------- |
| `-v`/`version` |                              | 版本信息，目前版本是`0.0.1`<br />Show version,the current version is `0.0.1` |
| `init`         | `project name`               | 生成`.vpm.json`包管理文件，参数`<project name>`项目名称，不填写则为当前所在目录的名称。<br />Generate the `.vpm.json` package management file. The parameter `<project name>` is the project name. If it is not filled, it is the name of the current directory. |
| `get`          | `<git-url>`     `<pkg-name>` | 从`<git-url>`下载包到`vlib`中，并添加`packages`记录到`.vpm.json`文件中。参数`<pkg-name>`为包的名称，不填写则为`<git-url>`中的项目名称。<br />Download the package from `<git-url>` to `vlib` and add the `packages` record to the `.vpm.json` file. The parameter `<pkg-name>` is the name of the package. If it is not filled, it is the name of the project in `<git-url>`. |
| `install`      |                              | 安装`.vpm.json`文件中的包。<br />Install the package from the `.vpm.json` file. |
| `-h`/`help`    |                              | 显示帮助信息。<br />Show help information.                   |
| `clean`        |                              | 删除`.vpm.json`文件。<br />Delete the `.vpm.json` file.      |

