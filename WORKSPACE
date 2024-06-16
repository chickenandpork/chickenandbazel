load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "aspect_bazel_lib",
    sha256 = "6d758a8f646ecee7a3e294fbe4386daafbe0e5966723009c290d493f227c390b",
    strip_prefix = "bazel-lib-2.7.7",
    url = "https://github.com/aspect-build/bazel-lib/releases/download/v2.7.7/bazel-lib-v2.7.7.tar.gz",
)

http_archive(
    name = "bazel_skylib",
    sha256 = "bc283cdfcd526a52c3201279cda4bc298652efa898b10b4db0837dc51652756f",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.7.1/bazel-skylib-1.7.1.tar.gz",
    ],
)

http_archive(
    name = "rules_pkg",
    sha256 = "cad05f864a32799f6f9022891de91ac78f30e0fa07dc68abac92a628121b5b11",
    urls = [
        "https://mirror.bazel.build/github.com/bazelbuild/rules_pkg/releases/download/1.0.0/rules_pkg-1.0.0.tar.gz",
        "https://github.com/bazelbuild/rules_pkg/releases/download/1.0.0/rules_pkg-1.0.0.tar.gz",
    ],
)

# Every rule of type pkg_tar_impl implicitly depends upon the target '@rules_pkg//:build_tar', but
# this target needs @rules_python//python:defs.bzl

http_archive(
    name = "rules_python",
    sha256 = "5bcfa3852444d084b1d3262714cec151b797648d4d444ea9895c7c7ed79cd715",
    strip_prefix = "rules_python-0.33.1",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.33.1/rules_python-0.33.1.tar.gz",
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
