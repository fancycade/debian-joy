def install_unstables()
  #Install unstable packages
  `sudo apt install software-properties-common`
  `sudo add-apt-repository  "deb http://deb.debian.org/debian/ sid main"`

  `sudo apt update`
  `sudo apt install bat`

  # Remove unstable apt repository
  `add-apt-repository --remove "deb http://deb.debian.org/debian/ sid main"`
end
