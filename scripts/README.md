# scripts

Helper scripts for this checkout. The root `README.md` and `docs/hello.md` are the build and test guide. Use these scripts. Do not run `cmake` yourself for configure, build, or test.

- `setup [--clean] [debug|release|profile]` configures `build/` and starts a project shell. `build` in that shell compiles `src/hello.scpp` with `scpp`. `build test` runs the suite. `--clean` runs `clean` first. `debug`, `release`, and `profile` select the CMake build type. `debug` and `profile` pass `-g` to `scpp`.
- `clean` removes `bin/`, `build/`, and `lib/`.

No script installs this program. Run `bin/hello`.
