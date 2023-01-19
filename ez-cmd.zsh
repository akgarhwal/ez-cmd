#!/bin/zsh

# Function to rebase the current branch with a given branch
rebase_with_branch() {
  # Get the current branch
  BRANCH=$(git rev-parse --abbrev-ref HEAD)

  # Store user input branch
  BRANCH_SELECTED=$1
  
  # TODO: if not branch is provided as input, show error to user and exit 

  # Checkout BRANCH_SELECTED
  # git checkout origin $BRANCH_SELECTED
  
  # Fetch the remote branch
  git fetch origin $BRANCH_SELECTED

  # Run the rebase
  git rebase origin/$BRANCH_SELECTED $BRANCH
}

# The plugin structure
# This code should be placed in a file named rebase.plugin.zsh and placed in the ~/.oh-my-zsh/plugins directory

# Plugin name
# This should match the name of the file

# plugin_name="rebase"

# Function to initialize the plugin
# This should set the plugin's settings and define any functions

# init() {

#   # Set any settings
#   # ...

#   # Define functions
#   autoload -Uz rebase_with_branch
# }

# Main function to execute the plugin
# This should be the entry point for the plugin, and should call the necessary functions

# main() {
#   init
#   rebase_with_branch
# }

# Call main()
# main
