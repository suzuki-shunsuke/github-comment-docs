---
sidebar_position: 400
---

# Usage

```console
$ github-comment help
NAME:
   github-comment - post a comment to GitHub

USAGE:
   github-comment [global options] command [command options] [arguments...]

VERSION:
   3.1.0

COMMANDS:
   post     post a comment
   exec     execute a command and post the result as a comment
   init     scaffold a configuration file if it doesn't exist
   hide     hide issue or pull request comments
   help, h  Shows a list of commands or help for one command

GLOBAL OPTIONS:
   --log-level value  log level [$GITHUB_COMMENT_LOG_LEVEL]
   --help, -h         show help (default: false)
   --version, -v      print the version (default: false)
```

## post

```console
$ github-comment help post
NAME:
   github-comment post - post a comment

USAGE:
   github-comment post [command options] [arguments...]

OPTIONS:
   --org value                     GitHub organization name
   --repo value                    GitHub repository name
   --token value                   GitHub API token [$GITHUB_TOKEN, $GITHUB_ACCESS_TOKEN]
   --sha1 value                    commit sha1
   --template value                comment template
   --template-key value, -k value  comment template key (default: "default")
   --config value                  configuration file path
   --pr value                      GitHub pull request number (default: 0)
   --var value                     template variable
   --var-file value                template variable name and file path
   --dry-run                       output a comment to standard error output instead of posting to GitHub (default: false)
   --skip-no-token, -n             works like dry-run if the GitHub Access Token isn't set (default: false) [$GITHUB_COMMENT_SKIP_NO_TOKEN]
   --silent, -s                    suppress the output of dry-run and skip-no-token (default: false)
   --stdin-template                read standard input as the template (default: false)
```

## exec

```console
$ github-comment help exec
NAME:
   github-comment exec - execute a command and post the result as a comment

USAGE:
   github-comment exec [command options] [arguments...]

OPTIONS:
   --org value                     GitHub organization name
   --repo value                    GitHub repository name
   --token value                   GitHub API token [$GITHUB_TOKEN, $GITHUB_ACCESS_TOKEN]
   --sha1 value                    commit sha1
   --template value                comment template
   --template-key value, -k value  comment template key (default: "default")
   --config value                  configuration file path
   --pr value                      GitHub pull request number (default: 0)
   --var value                     template variable
   --var-file value                template variable name and file path
   --dry-run                       output a comment to standard error output instead of posting to GitHub (default: false)
   --skip-no-token, -n             works like dry-run if the GitHub Access Token isn't set (default: false) [$GITHUB_COMMENT_SKIP_NO_TOKEN]
   --silent, -s                    suppress the output of dry-run and skip-no-token (default: false)
```

## hide

```console
$ github-comment help hide
NAME:
   github-comment hide - hide issue or pull request comments

USAGE:
   github-comment hide [command options] [arguments...]

OPTIONS:
   --org value                 GitHub organization name
   --repo value                GitHub repository name
   --token value               GitHub API token [$GITHUB_TOKEN, $GITHUB_ACCESS_TOKEN]
   --config value              configuration file path
   --condition value           hide condition
   --hide-key value, -k value  hide condition key (default: "default")
   --pr value                  GitHub pull request number (default: 0)
   --sha1 value                commit sha1
   --var value                 template variable
   --dry-run                   output a comment to standard error output instead of posting to GitHub (default: false)
   --skip-no-token, -n         works like dry-run if the GitHub Access Token isn't set (default: false) [$GITHUB_COMMENT_SKIP_NO_TOKEN]
   --silent, -s                suppress the output of dry-run and skip-no-token (default: false)
```
