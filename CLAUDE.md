# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

Third-party Homebrew tap distributing prebuilt CLI tool binaries from the [younsl/o](https://github.com/younsl/o) monorepo. Pull requests are disabled; this is a single-maintainer repository.

## Common Commands

```bash
# Validate formula syntax and best practices
brew audit --formula Formula/<name>.rb

# Check for new upstream releases
brew livecheck --formula Formula/<name>.rb

# Test a formula locally
brew install --build-from-source Formula/<name>.rb
brew test Formula/<name>.rb
```

## Formula Conventions

All formulas follow a strict pattern:

- **Binary source:** Prebuilt binaries from `https://github.com/younsl/o/releases/download/{formula}/{version}/{binary}-{os}-{arch}.tar.gz`
- **Platform matrix:** 4 targets required — macOS ARM64/Intel, Linux ARM64/Intel (`on_macos`/`on_linux` + `on_arm`/`on_intel` blocks)
- **Install method:** Renames platform-specific binary to the command name (e.g., `karc-darwin-arm64` → `karc`)
- **Livecheck regex:** Extracts version from GitHub releases using `regex(%r{formula-name/v?(\d+(?:\.\d+)+)}i)`
- **Test block:** Asserts `--version` output matches `version.to_s`
- **Caveats:** Only include when there are runtime dependencies (e.g., kubectl, AWS CLI)

## Commit Convention

```
<type>(<formula>): <description>
```

| Type | Usage |
|------|-------|
| `feat` | New formula |
| `bump` | Version update or SHA256 change |
| `nuke` | Formula removal |
