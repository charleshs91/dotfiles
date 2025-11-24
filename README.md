# dotfiles

Install [stow](https://www.gnu.org/software/stow/) to manage symlinks

```bash
brew install stow
```

Symlink files to the home directory by running either command

```bash
stow -d ./macos -t $HOME -S .
```

```bash
make stow-macos
```
