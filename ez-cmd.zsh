#!/bin/zsh

# ez-cmd plugin
# Simplifies and streamlines common command-line tasks

# Plugin name
# This should match the name of the file

plugin_name="ez-cmd"

cmd_prefix="ec_"

# Function to initialize the plugin
# This should set the plugin's settings and define any functions
init() {
  # Define functions
  autoload -Uz rebase_with_branch
  autoload -Uz push_changes
}

##################################
#             GIT                #
##################################

# Function to rebase the current branch with a given branch
ec_rebase_with_branch() {
  # Get Base branch from User Input
  local BASE_BRANCH=$1
  # Check is Base branch is provided by user or not
  if [[ -z $BASE_BRANCH ]]; then
    echo -e "\nError: No branch specified for rebase.\nUsages: rebase_with_branch [branch name]"
    return
  fi

  # Get the current branch
  local BRANCH=$(git rev-parse --abbrev-ref HEAD)

  # Fetch the remote branch
  git fetch origin $BASE_BRANCH

  # Run the rebase
  git rebase origin/$BASE_BRANCH $BRANCH
}

# Function to push the changes to the remote repository
ec_push_changes() {
  # Get the current branch
  local BRANCH=$(git rev-parse --abbrev-ref HEAD)

  # Push the changes
  git push origin $BRANCH
}

# Main function to execute the plugin
# This should be the entry point for the plugin, and should call the necessary functions
main() {
  init

  ec_rebase_with_branch; 
  ec_push_changes;
}

# Add the plugin to the oh-my-zsh plugin list
plugins=(... $plugin_name)

