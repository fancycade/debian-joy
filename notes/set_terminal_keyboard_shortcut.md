# Set Xfce4 keyboard shortcut

Go to apps, search keyboard, add a new shortcut. Easy.

# Via command line

```bash
xfconf-query --channel xfce4-keyboard-shortcuts --property "/commands/custom/<Primary><Alt>t" --create --type string --set "exo-open --launch TerminalEmulator"
```

For examples of what different commands might look like, take a look at `~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml`.