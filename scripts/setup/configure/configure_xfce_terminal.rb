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
