# Bazel Skill for Chickenandbazel Repository

## Problem

When bazel updates, there are deprecated internal functions that migrate outward; these then appear to be undefined.

For example, in Bazel-9.2, we start to see: "Error: no native function or rule 'sh_test'"

## Solution

Find where the definition exists now (searching the web for the exact error message helps) and put
a "load" statement at the start of the affected BUILD.bazel tho import the definition of the
function

`load` statements should be alpha-sorted at the top of the BUILD or BUILD.bazel file


## Known Examples

### Example `name 'py_binary' is not defined`

```
name 'py_binary' is not defined (did you mean 'cc_binary'?)
```

### Solution

Add a load statement to the affected BUILD or BUILD.bazel file to define the symbol:

```
load("@rules_python//python:py_binary.bzl", "py_binary")
```


### Example `name 'py_test' is not defined`

```
name 'py_test' is not defined (did you mean 'cc_test'?)
```

### Solution

Add a load statement to the affected BUILD or BUILD.bazel file to define the symbol:

```
load("@rules_python//python:py_test.bzl", "py_test")
```


### Example `no native function or rule 'sh_test'`

```
no native function or rule 'sh_test'
```

The error is caused by Bazel version changes. In Bazel 9.2.0, the native.sh_test function was removed.

### Solution

Add a `load` statement to the start of the affected BUILD.bazel or BUILD file

```
load("@rules_shell//shell:sh_test.bzl", "sh_test")
```

... then replace `native.sh_test` with the imported `sh_test`


