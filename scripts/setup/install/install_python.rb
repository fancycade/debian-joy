def install_python()
  `sudo apt install python3-virtualenv-clone`
  `sudo apt install pipenv`
  `sudo apt install elpa-elpy`
  `echo "" > .emacs`
  `echo "(elpy-enable)" > .emacs`
end
