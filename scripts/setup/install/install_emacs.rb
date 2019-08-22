def install_emacs()
  `sudo apt install emacs`
  `cp ../.emacs ~`
  `mkdir ~/.emacs.d`
  `cp ../mistyday-theme.el ~/.emacs.d`
  `echo "" > .bashrc`
  `echo "alias e='emacs -nw'" > .bashrc`
end
