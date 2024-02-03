---
sidebar_position: 500
---

# Configuration

## Configuration file path

The configuration file path can be specified with the `--config (-c)` option.
If the confgiuration file path isn't specified, the file named `^\.?github-comment\.ya?ml$` would be searched from the current directory to the root directory.

## Configuration file

You can scaffold a configuration file by `github-comment init` command.

```sh
github-comment init
```

e.g.

```yaml
hide:
  default: |
    Comment.HasMeta && Comment.Meta.SHA1 != Commit.SHA1 && ! (Comment.Meta.Program == "tfcmt" && Comment.Meta.Command == "apply")
post:
  tfmigrate-hcl-not-found:
    template: |
      ## :x: {{if .Vars.tfaction_target}}{{.Vars.tfaction_target}}: {{end}}.tfmigrate.hcl isn't found

      {{template "link" .}}

      To run `tfmigrate plan`, `.tfmigrate.hcl` is required.
    template_for_too_long: |
      comment is too long
exec:
  tfmigrate-plan:
    - when: true
      template: |
        ## {{template "status" .}} {{if .Vars.tfaction_target}}{{.Vars.tfaction_target}}: {{end}} tfmigrate plan

        {{template "link" .}}

        {{template "join_command" .}}

        {{template "hidden_combined_output" .}}
      template_for_too_long: |
        ## {{template "status" .}} {{if .Vars.tfaction_target}}{{.Vars.tfaction_target}}: {{end}} tfmigrate plan

        {{template "link" .}}

        {{template "join_command" .}}

        Command output is omitted as it is too long.
```

## post: variables which can be used in template

* Org
* Repo
* PRNumber
* SHA1
* TemplateKey
* Vars
* AvoidHTMLEscape: the function to post a comment without HTML escape by [Go's html/template](https://golang.org/pkg/html/template/)
* Sprig Function: http://masterminds.github.io/sprig/

:::caution
The function `Env` was removed in github-comment v6.0.0 for security.

> Env: the function to get the environment variable https://golang.org/pkg/os/#Getenv
:::

## exec

The configuration of `exec` is little more difficult than `post`, but the template key and `template` is same as `post`.
The each template is list which element has the attribute `when` and `template`, and `dont_comment`.
The attribute `when` is evaluated by the evaluation engine  https://github.com/antonmedv/expr , and the result should be `boolean`.
About expr, please see https://github.com/antonmedv/expr/blob/master/docs/Language-Definition.md too.
When the evaluation result is `false` the element is ignored, and the first matching element is used.
If `dont_comment` is `true`, the comment isn't created.
If no element matches, the comment isn't created without error.

In addition to the variables of `post` command, the following variables can be used in `when` and `template`

* Stdout: the command standard output
* Stderr: the command standard error output
* CombinedOutput: Stdout + Stderr
* Command: https://golang.org/pkg/os/exec/#Cmd.String
* JoinCommand: the string which the command and arguments are joined with the space character ` `
* ExitCode: the command exit code

## Define reusable template components

```yaml
templates:
  <template name>: <template content>
post:
  default:
    template: |
      {{template "<template name>" .}} ...
```

## Define variables

```yaml
vars:
  <variable name>: <variable value>
post:
  default:
    template: |
      {{.Vars.<variable name>}} ...
```

The variable can be passed with the option `-var <variable name>:<variable value>` too.

e.g.

```console
$ github-comment post -var name:foo
```
