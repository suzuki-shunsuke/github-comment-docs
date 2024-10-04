---
sidebar_position: 200
---

# Install

* [Homebrew](#homebrew)
* [aqua](#aqua)
* [GitHub Releases](#github-releases)

## Homebrew

You can install github-comment with [Homebrew](https://brew.sh/).

```console
$ brew install suzuki-shunsuke/github-comment/github-comment
```

## aqua

You can install github-comment with [aqua](https://aquaproj.github.io/).

```console
$ aqua g -i suzuki-shunsuke/github-comment
```

## GitHub Releases

Please download a binary from the [release page](https://github.com/suzuki-shunsuke/github-comment/releases).

### Verify downloaded binaries from GitHub Releases

You can verify downloaded binaries using some tools.

1. [Cosign](https://github.com/sigstore/cosign)
1. [slsa-verifier](https://github.com/slsa-framework/slsa-verifier)
1. [GitHub CLI](https://cli.github.com/)

#### 1. Cosign

You can install Cosign by aqua.

```sh
aqua g -i sigstore/cosign
```

```sh
gh release download -R suzuki-shunsuke/github-comment v6.2.1
cosign verify-blob \
  --signature github-comment_6.2.1_checksums.txt.sig \
  --certificate github-comment_6.2.1_checksums.txt.pem \
  --certificate-identity-regexp 'https://github\.com/suzuki-shunsuke/go-release-workflow/\.github/workflows/release\.yaml@.*' \
  --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
  github-comment_6.2.1_checksums.txt
```

Output:

```
Verified OK
```

After verifying the checksum, verify the artifact.

```sh
cat github-comment_6.2.1_checksums.txt | sha256sum -c --ignore-missing
```

#### 2. slsa-verifier

You can install slsa-verifier by aqua.

```sh
aqua g -i slsa-framework/slsa-verifier
```

```sh
gh release download -R suzuki-shunsuke/github-comment v6.2.1
slsa-verifier verify-artifact github-comment_6.2.1_darwin_arm64.tar.gz \
  --provenance-path multiple.intoto.jsonl \
  --source-uri github.com/suzuki-shunsuke/github-comment \
  --source-tag v6.2.1
```

Output:

```
Verified signature against tlog entry index 136872465 at URL: https://rekor.sigstore.dev/api/v1/log/entries/108e9186e8c5677a59e49ab5259899dbb7acf444257ae12b9bea6e420fb895ee3b8487181152cc54
Verified build using builder "https://github.com/slsa-framework/slsa-github-generator/.github/workflows/generator_generic_slsa3.yml@refs/tags/v2.0.0" at commit f204a947149fbbf2b33fa982c1af30b931b1aec2
Verifying artifact github-comment_6.2.1_darwin_arm64.tar.gz: PASSED
```

#### 3. GitHub CLI

You can install GitHub CLI by aqua.

```sh
aqua g -i cli/cli
```

```sh
gh release download -R suzuki-shunsuke/github-comment v6.2.1 -p github-comment_6.2.1_darwin_arm64.tar.gz
gh attestation verify github-comment_6.2.1_darwin_arm64.tar.gz \
  -R suzuki-shunsuke/github-comment \
  --signer-workflow suzuki-shunsuke/go-release-workflow/.github/workflows/release.yaml
```

Output:

```
Loaded digest sha256:2cbad3938bc861a0a0069766226d05865c9365ad3e920bded1c1016c67b21051 for file://github-comment_6.2.1_darwin_arm64.tar.gz
Loaded 1 attestation from GitHub API
✓ Verification succeeded!

sha256:2cbad3938bc861a0a0069766226d05865c9365ad3e920bded1c1016c67b21051 was attested by:
REPO                                 PREDICATE_TYPE                  WORKFLOW
suzuki-shunsuke/go-release-workflow  https://slsa.dev/provenance/v1  .github/workflows/release.yaml@7f97a226912ee2978126019b1e95311d7d15c97a
```
