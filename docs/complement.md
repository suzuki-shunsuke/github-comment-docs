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

To complement, [suzuki-shunske/go-ci-env](https://github.com/suzuki-shunsuke/go-ci-env) is used.

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

