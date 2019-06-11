
# Designed around this post: https://forum.xfce.org/viewtopic.php?pid=32033#p32033

def current_max_id
  plugins = `xfconf-query -c xfce4-panel -p /plugins -l`

  nums = []
  plugins.split(/\n/).each do |line|
    nums << line.split("/")[2].split("-")[1].to_i
  end

  nums.uniq.max
end

def make_launcher_dir(id)
  `mkdir ~/.config/xfce4/panel/launcher-#{id}`
end

def copy_desktop_file_to_dir(filename, id)
  `cp /usr/share/applications/#{filename} ~/.config/xfce4/panel/launcher-#{id}`
end

# Create xconf entry
def create_plugin_group(id)
  `xfconf-query -c xfce4-panel -p /plugins/plugin-#{id} -t string -s "launcher" --create`
end

def plugin_items_property(filename, id)
  `xfconf-query -c xfce4-panel -p /plugins/plugin-#{id}/items -t string -s "#{filename}" -a --create`
end

def list_plugin_ids
  s = `xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids`
  s.split(":")[1].split(/\n/)[2..]
end

def delete_plugins_array
  `xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids -rR`
end

# Order of ids determines order in panel display
def create_plugins_array(ids)
  command = "xfconf-query -c xfce4-panel -p /panels/panel-1/plugin-ids"
  ids.each do |id|
    command += " -t int -s #{id}"
  end
  command + " --create"
end

def restart_xfce_panel
  `xfce4-panel -r`
end

def main()
  
  desktop_files = [
    "firefox-esr.desktop",
    "Thunar.desktop",
    "xfce4-terminal.desktop",
    "xfce4-appfinder.desktop",
    "xfce4-power-manager-settings.desktop"
  ]

  max_id = current_max_id()

  ids = list_plugin_ids()

  desktop_files.each do |filename|
    max_id = max_id + 1
    make_launcher_dir(max_id)
    copy_desktop_file_to_dir(filename, max_id)
    create_plugin_group(max_id)
    plugin_items_property(filename, max_id)
    ids << max_id
  end

  delete_plugins_array()
  create_plugins_array(ids)

end
