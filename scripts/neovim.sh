#!/bin/bash

unlink "$HOME/.config/nvim"
stow -S neovim -t "$HOME"
