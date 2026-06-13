if status is-interactive
fastfetch
end
set -g fish_greeting
set -gx EDITOR nvim
set -gx SUDO_EDITOR $EDITOR
set -gx VISUAL nvim
set -gx TERMINAL kitty
set -gx MANPAGER "nvim +Man!"

# Aliases
source ~/.config/fish/aliases.fish
