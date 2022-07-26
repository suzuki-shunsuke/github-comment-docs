---
sidebar_position: 800
---

# Complement

## Complement options with Platform's built-in Environment variables

The following platforms are supported.

* CircleCI
* GitHub Actions
* Drone
* AWS CodeBuild
* Google Cloud Build

To complement, [suzuki-shunske/go-ci-env](https://github.com/suzuki-shunsuke/go-ci-env) is used.

## Google Cloud Build Support

[#521](https://github.com/suzuki-shunsuke/github-comment/pull/521), github-comment >= [v4.4.0](https://github.com/suzuki-shunsuke/github-comment/releases/tag/v4.4.0)

Set the environment variable `GOOGLE_CLOUD_BUILD`.

```sh
GOOGLE_CLOUD_BUILD=true
```

Set the following environment variables using [substitutions](https://cloud.google.com/cloud-build/docs/configuring-builds/substitute-variable-values).

* `COMMIT_SHA`
* `BUILD_ID`
* `PROJECT_ID`
* `_PR_NUMBER`
* `_REGION`

Specify the repository owner and name in `github-comment.yaml`.

e.g.

github-comment.yaml

```yaml
base:
  org: suzuki-shunsuke
  repo: github-comment
```

## Complement the pull request number from CI_INFO_PR_NUMBER

The environment variable `CI_INFO_PR_NUMBER` is set by [ci-info](https://github.com/suzuki-shunsuke/ci-info) by default. 
If the pull request number can't be gotten from platform's built-in environment variables but `CI_INFO_PR_NUMBER` is set, github-comment uses `CI_INFO_PR_NUMBER`.

## Complement options with any environment variables

In addition to the support of the above CI platforms, you can support other platforms with `complement` configuration.

```yaml
complement:
  pr:
  - type: envsubst
    value: '${GOOGLE_CLOUD_BUILD_PR_NUMBER}'
  org:
  - type: envsubst
    value: 'suzuki-shunsuke'
  repo:
  - type: envsubst
    value: '${GOOGLE_CLOUD_BUILD_REPO_NAME}'
  sha1:
  - type: envsubst
    value: '${GOOGLE_CLOUD_BUILD_COMMIT_SHA}'
  vars:
    yoo: # the variable "yoo" is added to "vars"
    - type: template
      value: '{{env "YOO"}}'
```

The following types are supported.

* `envsubst`: [drone/envsubst#EvalEnv](https://pkg.go.dev/github.com/drone/envsubst#EvalEnv)
* `template`: Go's [text/template](https://golang.org/pkg/text/template/) with [sprig functions](http://masterminds.github.io/sprig/)

