# Set panel size to 80
xfconf-query --channel 'xfce4-panel' --property '/panels/panel-1/size' --type int --set 80

# Delete panel 2 (lower panel)
xfconf-query --channel 'xfce4-panel' --property '/panels/panel-2' --reset --recursive
xfconf-query --channel 'xfce4-panel' --property '/panels' --force-array --type int --set 1
# Must restart xfce4-panel to see the effect

# Set pager plugin to 2 rows
xfconf-query --channel 'xfce4-panel' --property '/plugins/plugin-4/rows' --create --type int --set 2

# Set workspace count to 2
xfconf-query -c xfwm4 -p '/general/workspace_count' -s 2

# Set application menu icon
xfconf-query -c xfce4-panel -p '/plugins/plugin-1/button-icon' --create --type string --set 'xfce4-panel'

# Set application menu show button title to false
xfconf-query -c xfce4-panel -p '/plugins/plugin-1/show-button-title' --create --type bool -s false

# Turn off labels for tasklist
xfconf-query -c xfce4-panel -p '/plugins/plugin-3/show-labels' --create --type bool -s false
xfconf-query -c xfce4-panel -p '/plugins/plugin-3/show-handle' --create --type bool -s false