# A function to find the `lipo` executable in the local system, and when found, write a BUILD file representing it as a toolchain

def _write_build(ctx, path):
    if not path:
        path = ""
    ctx.template(
        "BUILD",
        Label("//toolchains/lipo:BUILD.tpl"),
        substitutions = {
            "{GENERATOR}": "//toolchains/lipo/configure_lipo_from_system.bzl%find_system_lipo",
            "{LIPO_PATH}": str(path),
        },
        executable = False,
    )

# use the system "which" to find the local `lipo`, writing whatever results (path or "") to hydrate
# the template
def _find_system_lipo_impl(ctx):
    lipo_path = ctx.which("lipo")

    if ctx.attr.verbose:
        if lipo_path:
            print("Found lipo at '%s'" % lipo_path)
        else:
            print("No system lipo found.")

    _write_build(ctx = ctx, path = lipo_path)

    # implicit None return: "reproducable with the given ctx"


# This _find_system_lipo, as a repository_rule, will run during collection of dependencies
find_system_lipo = repository_rule(
    implementation = _find_system_lipo_impl,
    doc = "Create a virtual external repository that contains a single BUILD file that defines the toolchain providing lipo executable based on system discovery",
    local = True,
    environ = ["PATH"],  # WARNING, cached result will flex with PATH changes
    attrs = {
        "verbose": attr.bool(
            doc = "Provide additional verbose output if set",
        ),
    },
)
