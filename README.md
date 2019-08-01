# vpm

([Available Chinese README version](README.CN.md))

vpm is a package manager for V, written on V.

#### Requirements

* V compiler `>=v0.1.13`.
* Install `git`, because the package is currently downloaded via `git clone`.
* Configured `VROOT` environment variable.

#### Building

```bash
$ git clone https://github.com/yue-best-practices/vpm
$ cd vpm
$ v -prod .
```

#### CLI Usage

| Command        | Params                    |  Description                                                 |
| :------------- | :------------------------ | :----------------------------------------------------------- |
| `-v`/`version` |                           | Show `vpm` version                                           |
| `init`         | `<project-name>`          | Initialize project (create the `.vpm.json` file)             |
| `get`          | `<git-url>`  `<pkg-name>` | Fetch package from the git repo (add dependency to the `.vpm.json`.  |                              
| `install`      |                           | Install the package from the `.vpm.json` file. |
| `-h`/`help`    |                           | Show help information.                   |
| `clean`        |                           | Delete the `.vpm.json` file.      |
| `ls`           |                           | Show installed packages list         |
| `rm`           | `<package-name>`...       | Remove packages in the .vpm.json file by name |
