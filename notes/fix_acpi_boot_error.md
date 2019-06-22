# Fix ACPI Boot error

With macbooks or other machines you might see an acpi error on boot up.

You can fix this by setting some kernel parameters.

```bash
sudo nano /etc/default/grub
```

Find a line that looks like this:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet"
```

Add `noapic acpi=force` to it.

Then update grub:
```bash
sudo update-grub
```

Now the next time you reboot you shouldn't see the error