# scripts

Helper scripts for this checkout. The root `README.md` and `docs/hello.md` are the build, test, and install guide. Use these scripts. Do not run `cmake` yourself for configure, build, test, or install.

- `setup [--clean] [debug|release|profile]` configures `build/` and starts a project shell. `build` in that shell compiles `src/hello.scpp` with `scpp`. `build test` runs the suite. `--clean` runs `clean` first. `debug`, `release`, and `profile` select the CMake build type. `debug` and `profile` pass `-g` to `scpp`.
- `install [prefix]` builds the program and installs `bin/hello`. With no argument the prefix is the one selected at configuration. A fresh configuration uses `$HOME/opt/smallcpp`, so the program is `$HOME/opt/smallcpp/bin/hello`. A prefix argument, or `--prefix` and a prefix, installs to that absolute path for this run. A relative prefix is rejected. `clean` does not remove the installed program.
- `clean` removes `bin/`, `build/`, and `lib/`.

Run `bin/hello` in the checkout, or run `bin/hello` under the prefix after `install`.
