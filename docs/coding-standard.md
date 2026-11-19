# smallcpp coding standard

This document is for programmers writing smallcpp. It is adapted from the
Cwhip coding standard. The Cwhip sections on FFI and formatter defaults
are not part of this standard.

smallcpp stays closer to C than to C++. A program does not use templates,
references, `auto`, lambdas, operator overloads, or the standard template
library. There is no `dict` type. Statements end with a semicolon. Source
files use the `.scpp` suffix. Do not invent an `sc_` prefix for a name.

## General guidelines

- Prefer to define class methods outside of the class body. Declare the
  method in the class, and write the body later as `Class::name`. This
  keeps the class small and readable.
- Always use a new line after a `{` and before a `}`. Including one line
  code blocks. This helps to visually define code blocks.
- Indents are 4 spaces. Continuations are allowed inside `[]` and `()`
  and indent is 8 spaces past the normal indent. A long call breaks
  after `(`, one argument per line, including a call on the right of
  `=`. A long out-of-line method keeps `Class::name` together and breaks
  after `(`, one parameter per line. A class base list stays on one
  line.
- One space around `=` and around binary operators, including `&&` and
  `||`. Unary `+`, `-`, `!`, and `~` stay tight. One space after a
  comma, none before. No space inside `()` or `[]`. One space before
  `{` when it shares the line.
- A comment-only line, `case`, `default`, a `{` on its own line, and
  `catch` when it starts a line use the block indent.
- Line length should be kept to less than 80 characters to allow clean
  editing on a console.

## Naming

- **Classes:** CamelCase, first letter capital. The base exception class
  is `Exception`.
- **Methods:** lowercase `with_under_score`. A constructor uses the class
  name.
- **Variables:** camelCase, first letter lower.
- **Enums:** `ALL_CAPS` with underscores. An enumerator is an integer
  constant. Prefer an enumerator over a magic number literal.

## Visibility / ownership

- Default visibility is private. Hiding data is seldom required — do
  **not** treat encapsulation as mandatory secrecy.
- Data allocated by an object (for example a file handle) is **owned**
  by that object. The collector reclaims the object. A `const char *`
  stored in an object is not copied. The caller keeps those characters
  alive.
- Do not mix related attributes across objects without a good reason.
- Keep public class elements together, and document the interface to the
  class.

## Init / empty

- Do **not** require initializing all class variables in the
  constructor.
- Declare a name before it is used.
- An empty C string (`""`) is a valid string. A null pointer is not a
  string. `Exception()` stores a null message.

## Exceptions / errors

- Use exceptions for **error recovery**, not for ordinary flow control.
- **Fatal:** rethrow with a bare `throw` so the stack trace surfaces.
  An exception that nothing catches aborts and prints a call stack with
  line numbers.
- **Recoverable:** `print` is OK (it may go unseen).
- Prefer exceptions over return codes.
- There is **no** assertion feature that compiles out for production.

## Tests

- No tests embedded in production code unless unavoidable.
- All testing code and data live under `tests/` (no outside data unless
  unavoidable).
- All testing goes through **CTest**.
- Keep tests as small as practical; treat them as example code when
  practical.
- `docs/CHANGELOG.md` records what the suite gained or lost.
