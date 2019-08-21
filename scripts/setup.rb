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

def install_firefox()
  `sudo apt install firefox-esr`
  `cd ~/.mozilla/firefox/*.default`
  `echo 'user_pref("layout.css.devPixelsPerPx", "2");' > user.js`
  `cd ~/projects/debian-joy/scripts`
end

@terminal_configs = {
  "MiscDefaultGeometry" => "90x30",
  "FontName" => "Monospace 18",
  "ColorForeground" => "#dcdcdc",
  "ColorBackground" => "#2c2c2c",
  "ColorCursor" => "#dcdcdc",
  "ColorPalette" => "#3f3f3f;#705050;#60b48a;#dfaf8f;#9ab8d7;#dc8cc3;#8cd0d3;#dcdcdc;#709080;#dca3a3;#72d5a3;#f0dfaf;#94bff3;#ec93d3;#93e0e3;#ffffff"
}

def configure_xfce_terminal()
  new_lines = []
  
  lines = File.readlines('~/.config/xfce4/terminal/terminalrc').each do |l|
    setting, value = l.split("=")
    if @terminal_configs.include? setting
      new_value = @terminal_configs[setting]
      new_lines << "#{setting}=#{new_value}"
    else
      new_lines << l
    end
  end

  File.writelines('~/.config/xfce4/terminal/terminalrc', new_lines)
end

install_emacs()
install_utils()
install_unstables()
install_python()
install_rust()
