#!/bin/bash
# Usage: install.sh
# Summary: Install all dotfiles into the home directory

set -e

# DOTFILES_ROOT="$(pwd -P)"

# for SRC_PATH in "$DOTFILES_ROOT"/*; do
  # [[ "$SRC_PATH" == **/Library ]] && continue
  # [[ "$SRC_PATH" == **/script ]] && continue
  # [[ "$SRC_PATH" == **/*.md ]] && continue
  # [[ "$SRC_PATH" == **/*.sh ]] && continue

  # DEST_PATH="${HOME}/.${SRC_PATH##${DOTFILES_ROOT}/}"
  # if [[ ! -e "$DEST_PATH" ]] || [[ "$(readlink "$DEST_PATH")" != "$SRC_PATH" ]]; then
    # if [[ -L "$DEST_PATH" ]] && [[ ! -d "$SRC_PATH" ]]; then
      # ln -sfv "$SRC_PATH" "$DEST_PATH"
    # else
      # rm -rfv "$DEST_PATH"
      # ln -sv "$SRC_PATH" "$DEST_PATH"
    # fi
  # fi
# done

# if [[ "$OSTYPE" == darwin* ]]; then
  # for SRC_PATH in "$DOTFILES_ROOT"/Library/**/*; do
    # DEST_PATH="${HOME}/${SRC_PATH##${DOTFILES_ROOT}/}"
    # if [[ ! -e "$DEST_PATH" ]] || [[ "$(readlink "$DEST_PATH")" != "$SRC_PATH" ]]; then
      # mkdir -p "${DEST_PATH%/*}"
      # if [[ -L "$DEST_PATH" ]] && [[ ! -d "$SRC_PATH" ]]; then
        # ln -sfv "$SRC_PATH" "$DEST_PATH"
      # else
        # rm -rfv "$DEST_PATH"
        # ln -sv "$SRC_PATH" "$DEST_PATH"
      # fi
    # fi
  # done
# fi
