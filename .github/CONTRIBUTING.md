# Contributing to this project

First of all, thank you for contributing, you're awesome!

## Pull Requests

### Writing a Pull Request

Matching Coding Standards
The API Platform project follows Symfony coding standards. But don't worry, you can fix CS issues automatically using the PHP CS Fixer tool:

```
make cs-fix
```

And then, add fixed file to your commit before push. 

Be sure to add only your modified files. If another files are fixed by cs tools, just revert it before commit.

### Sending a Pull Request

When you send a PR, just make sure that:

* You add valid test cases.
* Tests are green.
* Squash your commits into one commit. (see the next chapter)
* Fill in the following header from the pull request template:

```markdown
| Q             | A
| ------------- | ---
| Bug fix?      | yes/no
| New feature?  | yes/no
| BC breaks?    | no
| Deprecations? | no
| Tests pass?   | yes
| Fixed tickets | #1234, #5678

## Why
<!-- Une présentation du besoin -->

## To Do
* [x] Task 1
* [ ] Task 2
```

## Squash your Commits

If you have 3 commits. So start with:

```bash
git rebase -i HEAD~3
```

An editor will be opened with your 3 commits, all prefixed by pick.

Replace all `pick` prefixes by `fixup` (or `f`) **except the first commit** of the list.

Save and quit the editor.

After that, all your commits where squashed into the first one and the commit message of the first commit.

If you would like to rename your commit message type:

```bash
git commit --amend
```

Now force push to update your PR:

```bash
git push --force
```