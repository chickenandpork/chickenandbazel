load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "aspect_bazel_lib",
    sha256 = "b554eb7942a5ab44c90077df6a0c76fc67c5874c9446a007e9ba68be82bd4796",
    strip_prefix = "bazel-lib-2.7.1",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.7.1/bazel-lib-v2.7.1.tar.gz",
)

http_archive(
    name = "bazel_skylib",
    sha256 = "41449d7c7372d2e270e8504dfab09ee974325b0b40fdd98172c7fbe257b8bcc9",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.6.0/bazel-skylib-1.6.0.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.6.0/bazel-skylib-1.6.0.tar.gz",
    ],
)

http_archive(
    name = "rules_pkg",
    sha256 = "8f9ee2dc10c1ae514ee599a8b42ed99fa262b757058f65ad3c384289ff70c4b8",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/0.9.1/rules_pkg-0.9.1.tar.gz",
    ],
)

# Every rule of type pkg_tar_impl implicitly depends upon the target '@rules_pkg//:build_tar', but
# this target needs @rules_python//python:defs.bzl

http_archive(
    name = "rules_python",
    sha256 = "5868e73107a8e85d8f323806e60cad7283f34b32163ea6ff1020cf27abef6036",
    strip_prefix = "rules_python-0.25.0",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.25.0/rules_python-0.25.0.tar.gz",
)

# Unneeded until using unittests
#load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
#bazel_skylib_workspace()

load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

rules_pkg_dependencies()

load("@aspect_bazel_lib//lib:repositories.bzl", "aspect_bazel_lib_dependencies")

aspect_bazel_lib_dependencies()

###
# Tools bundled

load("//toolchains/bazelisk:deps.bzl", bazelisk_deps = "deps")

bazelisk_deps()

load("//toolchains/git-town:deps.bzl", git_town_deps = "deps")

git_town_deps()

load("//toolchains/ibazel:deps.bzl", ibazel_deps = "deps")

ibazel_deps()

###
# LIPO
#
# Find system lipo if it exists.
load("//toolchains/lipo:configure_lipo_from_system.bzl", "find_system_lipo")

find_system_lipo()
