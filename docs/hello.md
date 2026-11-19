# Hello

`src/hello.scpp` is the starter program. `main` calls `print` and returns 0. The program writes one line, and the test checks that line:

```
hello, smallcpp
```

`print` is part of the language. It is not declared in a header. The characters in the string are the whole line, including the newline.

## Build, test, and run

Use `scripts/setup`, `build`, `build test`, and `scripts/clean`. Do not run `cmake` yourself for those actions. This program has no install step. Nothing in the checkout is installed, and no script selects a prefix.

`scpp` compiles the program. It has to be on `PATH`, or installed at `$HOME/opt/smallcpp`, so the program is `$HOME/opt/smallcpp/bin/scpp`. `scripts/setup` searches `PATH` first, then that `bin` directory.

`scpp` reads `$HOME/.config/smallcpp/config.ini` when that file exists. `include` is the header directory. `library` is the library directory. `runtime` is the runtime archive. This program includes no header, so a missing file does not matter. A later `#include` uses that file. When the file is missing, `scpp` uses the prefix that contains its own `bin/` directory.

Start at the checkout root:

```sh
scripts/setup
build
build test
../bin/hello
exit
```

`scripts/setup [--clean] [debug|release|profile]` configures `build/` and starts a project shell. It works from any directory when you invoke this checkout's `scripts/setup`. A symlink kept outside `scripts/` resolves the wrong root. `--clean` runs `scripts/clean` before configuration. It may precede or follow the type. Setup refuses to start when a project shell is already active. Exit that shell first. An unknown argument exits 2.

`debug`, `release`, and `profile` set `CMAKE_BUILD_TYPE` to `Debug`, `Release`, and `RelWithDebInfo`. With no type, a fresh directory keeps CMake's default and a later run keeps the cached type. `debug` and `profile` pass `-g` to `scpp`. `release` and the default configuration do not. `scpp` has no optimization switch, so `release` and the default configuration compile the same way.

The shell reads `.project_env`, puts `bin/` and `scripts/` on `PATH`, and changes to `build/`. When `$HOME/opt/smallcpp/bin` exists, that directory is on `PATH` too. `build` compiles `src/hello.scpp` and writes `bin/hello`. `build test` builds that program, then CTest runs it and checks that stdout is the line `hello, smallcpp`. `rebuild` is a clean-first build. A name after `build` or `rebuild` is a target. `exit` leaves the shell.

`scripts/clean` removes `bin/`, `build/`, and `lib/`. `scpp` writes `hello.i` and `hello.o` in `build/` while it compiles, and deletes them after a successful link.

From the checkout root, after a build, `bin/hello` prints the line.
