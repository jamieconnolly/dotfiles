function _git_delete_branch() {
  compadd $(git branch -l | sed 's/[ \*]//g') && _ret=0
}
compdef _git_delete_branch git-delete-branch

function _git_prune_merged_branches() {
  compadd $(git branch -l | sed 's/[ \*]//g') && _ret=0
}
compdef _git_prune_merged_branches git-prune-merged-branches
