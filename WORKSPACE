load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")


load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "bazel_skylib",
    urls = [
        "https://github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/bazel-skylib/releases/download/1.0.3/bazel-skylib-1.0.3.tar.gz",
    ],
    sha256 = "1c531376ac7e5a180e0237938a2536de0c54d93f5c278634818e0efc952dd56c",
)

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_proto",
    sha256 = "2a20fd8af3cad3fbab9fd3aec4a137621e0c31f858af213a7ae0f997723fc4a9",
    strip_prefix = "rules_proto-a0761ed101b939e19d83b2da5f59034bffc19c12",
    urls = [
        "https://github.com/bazelbuild/rules_proto/archive/a0761ed101b939e19d83b2da5f59034bffc19c12.tar.gz",
        "https://mirror.bazel.build/github.com/bazelbuild/rules_proto/archive/a0761ed101b939e19d83b2da5f59034bffc19c12.tar.gz",
    ],
)

load("@rules_proto//proto:repositories.bzl", "rules_proto_dependencies", "rules_proto_toolchains")

rules_proto_dependencies()

rules_proto_toolchains()

# NOTE: URLs are mirrored by an asynchronous review process. They must
#       be greppable for that to happen. It's OK to submit broken mirror
#       URLs, so long as they're correctly formatted. Bazel's downloader
#       has fast failover.

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# gazelle:repository go_repository name=com_github_bazelbuild_rules_go importpath=github.com/bazelbuild/rules_go
http_archive(
    name = "io_bazel_rules_go",
    sha256 = "7b9bbe3ea1fccb46dcfa6c3f3e29ba7ec740d8733370e21cdc8937467b4a4349",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/rules_go/releases/download/v0.22.4/rules_go-v0.22.4.tar.gz",
        "https://github.com/bazelbuild/rules_go/releases/download/v0.22.4/rules_go-v0.22.4.tar.gz",
    ],
)

http_archive(
    name = "bazel_gazelle",
    sha256 = "b85f48fa105c4403326e9525ad2b2cc437babaa6e15a3fc0b1dbab0ab064bc7c",
    urls = [
        "https://storage.googleapis.com/bazel-mirror/github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
        "https://github.com/bazelbuild/bazel-gazelle/releases/download/v0.22.2/bazel-gazelle-v0.22.2.tar.gz",
    ],
)

load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

go_rules_dependencies()

go_register_toolchains()

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")  # https://github.com/bazelbuild/rules_go/issues/1716

gazelle_dependencies()

load(":bzl/go_repositories.bzl", "go_repositories")

# gazelle:repository_macro bzl/go_repositories.bzl%go_repositories
go_repositories()

load("//:bzl/bazelisk_repositories.bzl", bazelisk_repositories="go_repositories")
bazelisk_repositories()

load("//:bzl/ibazel_repositories.bzl", ibazel_repositories="go_repositories")
ibazel_repositories()

load("//:bzl/workspace_checksums.bzl", "versions", "shasums")

# This is just an overwrought method of writing actual values in a single place
_ibazel = shasums["ibazel"][versions()["ibazel"]]
git_repository(
    name = "ibazel",
    remote = "git@github.com:bazelbuild/bazel-watcher.git",
    commit = shasums["ibazel"][versions()["ibazel"]]["commit"],
    shallow_since = shasums["ibazel"][versions()["ibazel"]]["shallow_since"],
)

git_repository(
    name = "bazelisk",
    remote = "git@github.com:bazelbuild/bazelisk.git",
    commit = shasums["bazelisk"][versions()["bazelisk"]]["commit"],
    shallow_since = shasums["bazelisk"][versions()["bazelisk"]]["shallow_since"],
)

http_archive(
    name = "build_bazel_rules_nodejs",
    sha256 = "84abf7ac4234a70924628baa9a73a5a5cbad944c4358cf9abdb4aab29c9a5b77",
    urls = ["https://github.com/bazelbuild/rules_nodejs/releases/download/1.7.0/rules_nodejs-1.7.0.tar.gz"],
)

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "a41a75c291c69676b9974458ceee09aea60cee0e1ee282e27cdc90b679dfd30f",
    url = "https://github.com/bazelbuild/rules_apple/releases/download/0.21.2/rules_apple.0.21.2.tar.gz",
)

load(
    "@build_bazel_rules_apple//apple:repositories.bzl",
    "apple_rules_dependencies",
)

apple_rules_dependencies()

load(
    "@build_bazel_apple_support//lib:repositories.bzl",
    "apple_support_dependencies",
)

apple_support_dependencies()
