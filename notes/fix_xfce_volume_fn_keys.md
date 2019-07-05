When using xfce you may not be able to use your fn keys to adjust the volume.

The way to fix this is to make sure you have `xfce4-pulseaudio-plugin` installed and enabled.

```bash
apt install xfce4-pulseaudio-plugin
```

Then go to panel preferences and add the pulseaudio to the plugin items.

Now the fn keys for audio should work.