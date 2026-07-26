# Bazel Skill for Chickenandbazel Repository

## Problem
This repository uses Bazel to build a macOS package containing various tools.
When running Bazel commands, users may encounter permission issues with:
- Cache directory creation
- Network binding (localhost)
- Sandbox directory access

## Solution
Use the `--config=agent` flag to mitigate these issues:

### Usage Examples
`bazel build //... --config=agent`
`bazel test //... --config=agent`
`bazel run //... --config=agent`

## Configuration
The configuration is defined in the .bazelrc file with:
- JVM arguments to prefer IPv4 networking
- Sandbox directory configuration to use /tmp
- Other flags to improve compatibility

## Alternative Approaches
If you continue to have issues, try:
1. Setting environment variables:
   ```bash
   export BAZEL_CACHE_DIR=/tmp/bazel-cache
   export BAZEL_OUTPUT_BASE=/tmp/bazel-output
   ```

2. Using the Bazelisk approach:
   ```bash
   ./bazelisk build //... --config=agent
   ```

