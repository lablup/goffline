# Goffline

How to use Go modules offline, without a GOPROXY like [Athens](https://github.com/gomods/athens) or a bunch of `git clone` and with keeping checksums verification.

Binaries for both architectures `amd64` and `arm64` are built during the download step, and the right one extracted during the installation step.

## Requirements

Linux or macOS (Windows not tested) with Docker and Internet access.

## Usage

Make a self-extracting archive of Go modules:

```bash
./golang.sh [module list] mods
```

The result will be three files:

- `mods-[Go version]-[timestamp].sh` : the self-extracting archive (with a few command-line options)
- `mods-[Go version]-[timestamp].sh.sha256` : archive checksum
- `mods-[Go version]-[timestamp].list` : download info and module list

Make a self-extracting archive of Go modules used by the [Go extension](https://marketplace.visualstudio.com/items?itemName=golang.go) for Visual Studio Code (only the compiled binaries, seems to be sufficient):

```bash
./golang.sh vscode-bin
```

Download current stable version of Visual Studio Code, some extensions and the remote server (for [remote development](https://code.visualstudio.com/docs/remote/remote-overview)):

```bash
./vscode.sh [extension list]
```

See [config.txt](./config.txt) for an example of module and extenion list.

There is a unit test for Go downloads, run into a container with no Internet access (`--network none`).