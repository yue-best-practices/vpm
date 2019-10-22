# vpm

vpm(`0.0.2`)是一个v语言包管理工具，它用v编写而成。| ([Available Portuguese README version](README.PT.md))

* 目前包下载到`~/.vmodules`目录

#### 前置条件

* `V`语言版本（`v0.1.17`）。
* 安装`git`，因为目前包是通过`git clone`的方式下载的。

#### 安装

```bash
$ git clone https://github.com/yue-best-practices/vpm
$ cd vpm
$ v -prod .
```

#### 命令

| 命令   | 参数                       | 释义                                                                 |
| :------------- | :------------------------ | :-----------------------------------------------------------|
| `-v`/`version` |                           | 版本信息，目前版本是`0.0.2`                                   |
| `init`         | `<project-name>`          | 创建`vpm.json`文件                                          |
| `get`          | `<git-url>`  `<pkg-name>` | 从`<git-url>`中获取包。                                       |
| `install`      |                           | 安装`vpm.json`文件中的包。                                   |
| `-h`/`help`    |                           | 显示帮助信息。                                                 |
| `clean`        |                           | 删除`vpm.json`文件。                                         |
| `ls`           |                           | 显示已安装的包列表                                             |
| `rm`           | `<package-name>`...       | 按名称删除`vpm.json`文件中的包                                 |

#### 示例

这里是一个使用`args`包的例子

- 创建项目目录 `test`

```bash
$ mkdir test
$ cd test
```

- 初始化 `vpm.json`

```bash
$ vpm init
```

- 编写示例代码

```bash
$ vim main.v
```

```rust
import args
import os

fn main() {
    _args := args.parse(os.args, 1)
    println(_args.str())
    println(_args.command)
    println(_args.unknown[0])
}
```

- 安装 `args` 包

```bash
$ vpm get https://github.com/nedpals/v-args args
```

- 构建

```bash
$ v -prod main.v
```

- 运行

```bash
$ ./main hello world
{ command: hello, options: {}, unknown: ["world"] }
hello
world
```
