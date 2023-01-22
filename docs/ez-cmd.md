# ez_cmd
The ez_cmd plugin is a simple command line tool that provides two commands for Git users: ec_rebase_with_branch and ec_push_changes.

## Commands

## ec_rebase_with_branch
This command will rebase your current branch with the latest changes from a specified base branch.

```zsh
# Usage: 
ec_rebase_with_branch <branch>

# Example: 
ec_rebase_with_branch develop
```

## ec_push_changes
This command allows you to push your branch to the remote repository.

```zsh
# Usage:
ec_push_changes
```


### Note
* Please note that `ec_rebase_with_branch` command will not work if you have uncommitted changes.
