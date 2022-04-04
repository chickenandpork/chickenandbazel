load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive", "http_file")
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

RULES_PKG_COMMIT="8691378c7e41fca1a5f4f2c7f692c38cf8fba6b8"  # v0.4.0 + pkgbuild (issue 264)
http_archive(
    name = "rules_pkg",
    urls = [
	"https://github.com/chickenandpork/rules_pkg/archive/{}.tar.gz".format(RULES_PKG_COMMIT),
    ],
    sha256 = "f955807cbd2b1b74e66746d47d6231b0968ccb67a012ecb8000b650c424fea1d",
    strip_prefix = "rules_pkg-{}".format(RULES_PKG_COMMIT),
)

# Every rule of type pkg_tar_impl implicitly depends upon the target '@rules_pkg//:build_tar', but
# this target needs @rules_python//python:defs.bzl

http_archive(
    name = "rules_python",
    sha256 = "778197e26c5fbeb07ac2a2c5ae405b30f6cb7ad1f5510ea6fdac03bded96cc6f",
    url = "https://github.com/bazelbuild/rules_python/releases/download/0.2.0/rules_python-0.2.0.tar.gz",
)

# rules_pkg::toolchains need rules_license

git_repository(
    name = "rules_license",
    commit = "eda4e9c2cde8d6a8d05f3f7cd182ea824a3b2830",  # platform_commit_hash
    remote = "https://github.com/bazelbuild/rules_license.git",
    shallow_since = "1643730996 -0500"
)



# == Static content ==

versions = {
  "bazelisk": [ # sort newest/latest first
    { "version": "1.11.0", "sha256": "c725fd574ea723ab25187d63ca31a5c9176d40433af92cd2449d718ee97e76a2" },
    { "version": "1.7.5", "sha256": "a0ae9a66b1f41f3312785ec5e17404c7fd2a16a35703c9ea7c050406e20fc503" },
  ],
  "ibazel": [ # sort newest/latest first
    { "version": "0.16.2", "sha256": "be81d0a19804bfbe571d562ef5ad53dc28b6ab1c920d150e5b8d48042cf919a8" },
    { "version": "0.15.0", "sha256": "e0d2ab8b8ff4c75c171a0cf11207d601a81a0351fcc4b64191763d99dad7901d" },
  ],
}
    
    
VER_IBAZEL = "0.15.0"
URL_IBAZEL = "https://github.com/bazelbuild/bazel-watcher/releases/download/v{}/ibazel_darwin_amd64".format(VER_IBAZEL)

# the download will always take the first entry for version/shasum
#
# NOTE: we are calling this "bazel" with the convention that `bazelisk` will download and use the
# latest version constrained by any present .bazelversion file.  We don't so this for pipeline
# builds because:
# 1. doesn't cache
# 2. we know already what version we'll need (it's in the project)
# 3. why re-download bazel every time?  Just provide a versioned image of the right release
# 3.1 ... and that build container with a specific version of bazel will cache on the k8s-node
#
http_file(
    name = "bazelisk",
    urls = [
        u.format(versions["bazelisk"][0]["version"]) for u in [
            "https://github.com/bazelbuild/bazelisk/releases/download/v{}/bazelisk-darwin-amd64",
        ]
    ],
    downloaded_file_path = "bazel", # what to call the file (calling it "bazel" causes it to 
    sha256 = versions["bazelisk"][0]["sha256"],
)


# remember: the download will always take the first entry for version/shasum above
http_file(
    name = "ibazel",
    urls = [
        u.format(versions["ibazel"][0]["version"]) for u in [
            "https://github.com/bazelbuild/bazel-watcher/releases/download/v{}/ibazel_darwin_amd64",
        ]
    ],
    downloaded_file_path = "ibazel", # what to call the file
    sha256 = versions["ibazel"][0]["sha256"],
)

