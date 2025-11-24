# dotfiles

This setup for managing *dotfiles* is based off a tool called [**stow**](https://www.gnu.org/software/stow/). 
It utilizes symlinks to keep different configurations (e.g., `.zshrc`, `.zprofile`, `~/.config/nvim` etc.) 
in a single location. Combined with version control tool such as [git](https://git-scm.com/), it provides 
an easy way of managing and organizing a collection of configuration files, and allows for easy rollbacks 
as well as seamless synchronization across different working environments. 

## Usage

### Pre-requisites

If you have [Homebrew](https://brew.sh) installed on your system, simply run the following command to install stow:
```bash
brew install stow
```

### Activate symlinks

```bash
stow -d ./macos -t $HOME -S .
```

### Reset symlinks

This command will remove the symlinks from the home directory.

```bash
stow -d ./macos -t $HOME -D .
```

### Ignoring files 

Specify paths in `.stow-local-ignore` file. These files/directories will not be symlinked by stow.

## Remarks

### git

#### `~/.config/git/ignore`

This file works as a global `.gitignore` that applies to any Git repository.
Check out [GitHub's ignoring files guide][doc-git-ignore-all-repos] for more details.

[doc-git-ignore-all-repos]: https://docs.github.com/en/get-started/git-basics/ignoring-files#configuring-ignored-files-for-all-repositories-on-your-computer
