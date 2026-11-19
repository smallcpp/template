# template

Starter for an application written in scpp, the smallcpp language. This repository is a GitHub template. Copy it for a new program, then replace `src/hello.scpp`.

`src/hello.scpp` prints one line, `hello, smallcpp`. `docs/hello.md` is the reader document for that program, the build, and the install.

Use the scripts in `scripts/`. Do not run `cmake` yourself to configure, build, test, or install. `scripts/setup` configures `build/` and starts a project shell. `build` in that shell compiles the program. `build test` runs the suite. `install` builds the program and copies `bin/hello` into the install prefix. `scripts/clean` removes the build products in the checkout. It leaves an installed copy where it is.

`scpp` has to be on `PATH`, or installed at `$HOME/opt/smallcpp` (the compiler is `$HOME/opt/smallcpp/bin/scpp`). When `$HOME/.config/smallcpp/config.ini` exists, `scpp` reads header and library locations from it.

Start at the checkout root:

```sh
scripts/setup
build
build test
install
../bin/hello
exit
```

`scripts/setup [--clean] [debug|release|profile]` works from any directory when you invoke this checkout's `scripts/setup`. `--clean` runs `scripts/clean` first. `debug`, `release`, and `profile` set the CMake build type. `debug` and `profile` pass `-g` to `scpp`. The shell reads `.project_env`, puts `bin/` and `scripts/` on `PATH`, and changes to `build/`. When `$HOME/opt/smallcpp/bin` exists, the shell puts that directory on `PATH` as well. `exit` leaves the shell.

`install` with no argument uses the prefix selected at configuration. A fresh configuration installs to `$HOME/opt/template`. The program is `bin/hello` under that prefix, so the default path is `$HOME/opt/template/bin/hello`. `install /absolute/path` and `install --prefix /absolute/path` install to that prefix for this run. A later `install` with no argument uses the configured prefix again. From the checkout root, `scripts/install` and `scripts/install /absolute/path` are the same commands. A relative prefix is rejected.
