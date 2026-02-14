# homebrew-tap

[![Homebrew](https://img.shields.io/badge/Homebrew-tap-black?style=flat-square&logo=homebrew&logoColor=white)](https://github.com/younsl/homebrew-tap)
[![GitHub license](https://img.shields.io/github/license/younsl/homebrew-tap?style=flat-square&color=black)](https://github.com/younsl/homebrew-tap/blob/main/LICENSE)
[![GitHub last commit](https://img.shields.io/github/last-commit/younsl/homebrew-tap?style=flat-square&color=black)](https://github.com/younsl/homebrew-tap/commits/main)

[Homebrew](https://brew.sh) [tap](https://docs.brew.sh/Taps) (third-party repository) for [younsl/o](https://github.com/younsl/o) CLI tools. Provides prebuilt binaries so you can install without Rust toolchain.

## Prerequisites

[Homebrew](https://brew.sh) must be installed to use this tap.

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Usage

```bash
brew tap younsl/tap
brew search younsl/tap
brew install <FORMULA>
```

## Formulae

List of installable formulae in this tap.

| Repository | Formula | Version | Description |
|------------|---------|---------|-------------|
| [younsl/o](https://github.com/younsl/o/tree/main/box/kubernetes/karc) | [`karc`](Formula/karc.rb) | 0.1.0 | Karpenter NodePool consolidation manager CLI tool |
| [younsl/o](https://github.com/younsl/o/tree/main/box/kubernetes/kup) | [`kup`](Formula/kup.rb) | 0.1.0 | Interactive EKS cluster upgrade CLI tool |
| [younsl/o](https://github.com/younsl/o/tree/main/box/tools/ij) | [`ij`](Formula/ij.rb) | 0.1.0 | Interactive EC2 Session Manager connection tool with fuzzy search |
| [younsl/o](https://github.com/younsl/o/tree/main/box/kubernetes/promdrop) | [`promdrop`](Formula/promdrop.rb) | 0.1.0 | Prometheus metric filter configuration generator |

## License

This project is licensed under the [MIT License](LICENSE).
