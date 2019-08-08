# vpm

([Available Chinese README version](README.CN.md))

vpm(`0.0.2`) is a package manager for V, written on V.

* The package is now downloaded to the `~/.vmodules` directory.

#### Requirements

* V compiler `>=v0.1.17`.
* Install `git`, because the package is currently downloaded via `git clone`.

#### Building

```bash
$ git clone https://github.com/yue-best-practices/vpm
$ cd vpm
$ v -prod .
```

#### CLI Usage

| Command        | Params                    | Description                                                  |
| :------------- | :------------------------ | :----------------------------------------------------------- |
| `-v`/`version` |                           | Show `vpm` version                                           |
| `init`         | `<project-name>`          | Initialize project (create the `vpm.json` file)              |
| `get`          | `<git-url>`  `<pkg-name>` | Fetch package from the git repo (add dependency to the `vpm.json`. |
| `install`      |                           | Install the package from the `vpm.json` file.                |
| `-h`/`help`    |                           | Show help information.                                       |
| `clean`        |                           | Delete the `vpm.json` file.                                  |
| `ls`           |                           | Show installed packages list                                 |
| `rm`           | `<package-name>`...       | Remove packages in the `vpm.json` file by name               |

#### Example

Here is an example of using the `args`  package.

* Make project directory `test`

```bash
$ mkdir test
$ cd test
```

* Init `vpm.json`

```bash
$ vpm init
```

* Write example code

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

* Install `args` package

```bash
$ vpm get https://github.com/nedpals/v-args args
```

* Build

```bash
$ v -prod main.v
```

* Run 

```bash
$ ./main hello world
{ command: hello, options: {}, unknown: ["world"] }
hello
world
```

