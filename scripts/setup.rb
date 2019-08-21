# Install dependencies

def install_emacs()
  `sudo apt install emacs`
  `cp ../.emacs ~`
  `mkdir ~/.emacs.d`
  `cp ../mistyday-theme.el ~/.emacs.d`
  `echo "" > .bashrc`
  `echo "alias e='emacs -nw'" > .bashrc`
end

def install_utils()
  `sudo apt install exa tree htop nano`
end

def install_unstables()
  #Install unstable packages
  `sudo apt install software-properties-common`
  `sudo add-apt-repository  "deb http://deb.debian.org/debian/ sid main"`

  `sudo apt update`
  `sudo apt install bat`

  # Remove unstable apt repository
  `add-apt-repository --remove "deb http://deb.debian.org/debian/ sid main"`
end

def install_python()
  `sudo apt install python3-virtualenv-clone`
  `sudo apt install pipenv`
  `sudo apt install elpa-elpy`
  `echo "" > .emacs`
  `echo "(elpy-enable)" > .emacs`
end

def install_rust()
  `sudo apt install cargo`
end

install_emacs()
install_utils()
install_unstables()
install_python()
install_rust()
