#!/bin/zsh

# ez-cmd plugin
# Simplifies and streamlines common command-line tasks

# Plugin name
# This should match the name of the file

plugin_name="ez-cmd"

# Function to initialize the plugin
# This should set the plugin's settings and define any functions
init() {
  # Define functions
  autoload -Uz rebase_with_branch
  autoload -Uz switch_branch
  autoload -Uz push_changes
}

##################################
#             GIT                #
##################################

# Function to rebase the current branch with a given branch
rebase_with_branch() {
  # Get the current branch
  local BRANCH=$(git rev-parse --abbrev-ref HEAD)

  # Get the list of branches
  local BRANCHES=$(git branch -r | sed 's/*//')

  # Ask the user to select a branch
  echo "Please select a branch to rebase with $BRANCH:"
  select BRANCH_SELECTED in $BRANCHES; do
    if [ -n "$BRANCH_SELECTED" ]; then
      break
    fi
  done

  # Fetch the remote branch
  git fetch origin $BRANCH_SELECTED

  # Run the rebase
  git rebase origin/$BRANCH_SELECTED $BRANCH
}

# Function to switch the current branch
switch_branch() {
  # Get the list of branches
  local BRANCHES=$(git branch -a)

  # Ask the user to select a branch
  echo "Please select a branch to switch to:"
  select BRANCH_SELECTED in $BRANCHES; do
    if [ -n "$BRANCH_SELECTED" ]; then
      break
    fi
  done

  # Switch to the selected branch
  git checkout $BRANCH_SELECTED
}

# Function to push the changes to the remote repository
push_changes() {
  # Get the current branch
  local BRANCH=$(git rev-parse --abbrev-ref HEAD)

  # Push the changes
  git push origin $BRANCH
}

# Main function to execute the plugin
# This should be the entry point for the plugin, and should call the necessary functions
main() {
  init
  echo "Please select a function:"
  select choice in "Rebase with branch" "Switch Branch" "Push changes"; do
    case $choice in
      "Rebase with branch" ) rebase_with_branch; break;;
      "Switch Branch" ) switch_branch; break;;
      "Push changes" ) push_changes; break;;
    esac
  done
}

# Add the plugin to the oh-my-zsh plugin list
plugins=(... $plugin_name)
