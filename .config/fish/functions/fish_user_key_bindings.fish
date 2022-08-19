# https://github.com/craftzdog/dotfiles-public/blob/master/.config/fish/functions/fish_user_key_bindings.fish

function fish_user_key_bindings
  # vim-like
  # bind \cl forward-char

  # prevent iterm2 from closing when typing Ctrl-D (EOF)
  bind \cd delete-char
  
  # peco
  # bind \cr peco_select_history # Bind for peco select history to Ctrl+R
  # bind \cf peco_change_directory # Bind for peco change directory to Ctrl+F
end
