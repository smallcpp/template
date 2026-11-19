# template

Starter for an application written in scpp, the smallcpp language. This repository is a GitHub template. Copy it for a new program, then replace `src/hello.scpp`.

`src/hello.scpp` prints one line, `hello, smallcpp`. `docs/hello.md` is the reader document for that program and for the build.

Use the scripts in `scripts/`. Do not run `cmake` yourself to configure, build, or test. `scripts/setup` configures `build/` and starts a project shell. `build` in that shell compiles the program. `build test` runs the suite. `scripts/clean` removes the build products. No script installs the program, and there is no install step: run `bin/hello`.

`scpp` has to be on `PATH`, or installed at `$HOME/opt/smallcpp` (the compiler is `$HOME/opt/smallcpp/bin/scpp`). When `$HOME/.config/smallcpp/config.ini` exists, `scpp` reads header and library locations from it.

Start at the checkout root:

```sh
scripts/setup
build
build test
../bin/hello
exit
```

`scripts/setup [--clean] [debug|release|profile]` works from any directory when you invoke this checkout's `scripts/setup`. `--clean` runs `scripts/clean` first. `debug`, `release`, and `profile` set the CMake build type. `debug` and `profile` pass `-g` to `scpp`. The shell reads `.project_env`, puts `bin/` and `scripts/` on `PATH`, and changes to `build/`. When `$HOME/opt/smallcpp/bin` exists, the shell puts that directory on `PATH` as well. `exit` leaves the shell.
