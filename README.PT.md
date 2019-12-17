# vpm

([Versão README chinesa](README.CN.md)) | ([Versão README em português](README.PT.md))

vpm(`0.0.2`) é um gerenciador de pacotes para V, escrito em V.

* O pacote agora está disponível no diretório `~ / .vmodules`.

#### Requerimentos

* V compiler `>=v0.1.23`.
* Instale `git`, porque o pacote está atualmente disponível via `git clone`.

#### Building

```bash
$ git clone https://github.com/yue-best-practices/vpm
$ cd vpm
$ v -prod .
```

#### Uso da CLI

| Comando        | Parâmetros                | Descrição                                                              |
| :------------- | :------------------------ | :----------------------------------------------------------------------|
| `-v`/`version` |                           | Mostra a versao do `vpm`                                               |
| `init`         | `<project-name>`          | Initializa o projeto (cria o arquivo `vpm.json`)                       |
| `get`          | `<git-url>`  `<pkg-name>` | Busca o pacote no repositório git (adiciona dependência ao `vpm.json`. |
| `install`      |                           | Instala o pacote a partir do arquivo `vpm.json`.                       |
| `-h`/`help`    |                           | Mostra informações de ajuda.                                           |
| `clean`        |                           | Deleta o arquivo `vpm.json`.                                           |
| `ls`           |                           | Mostra lista de pacotes instaladas                                     |
| `rm`           | `<package-name>`...       | Remove pacotes no arquivo `vpm.json` por nome                          |

#### Pacotes

Para ter uma visão geral de todos os pacotes disponíveis e suportados, você pode ler essa referência [VPM Repository](http://vpmrepository.com).

#### Exemplo

Aqui está um exemplo de uso do pacote `args`.

* Faça o diretório do projeto `test`

```bash
$ mkdir test
$ cd test
```

* Initializa vpm

```bash
$ vpm init
```

* Escrevendo um código como exemplo

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

* Instalando o pacote `args`

```bash
$ vpm get https://github.com/nedpals/v-args args
```

* Build

```bash
$ v -prod main.v
```

* Rodando o app 

```bash
$ ./main hello world
{ command: hello, options: {}, unknown: ["world"] }
hello
world
```
