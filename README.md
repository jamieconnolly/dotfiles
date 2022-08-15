# Dotfiles

> In Unix-like operating systems, any file or folder that starts with a dot
> character (for example, /home/user/.config), commonly called a dot file or
> dotfile, is to be treated as hidden.
> A convention arose of using dotfile in the user's home directory to store
> per-user configuration or informational text.

## Getting started

These are the steps for installing on a clean machine:

```
git clone https://github.com/jamieconnolly/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
script/setup
```

## Updating

Once you have the dotfiles installed, you can run the following commands to make
sure that they are kept up-to-date.

```
cd ~/.dotfiles
script/update
```

## Thanks

Thank you to everyone who has shared their dotfiles and other shell scripts from
which I have derived inspiration from.

Feel free to fork this repository, and configure it for yourself.
