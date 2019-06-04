# Debian Joy Project

Project originated by Harley Swick, to make the usage, development of GNU/Linux and Free Software in general more joyful.

This idea of joy is heavily inspired by the Ruby philosophy of developer happiness.

# djoy

Command line utility used to run the xfce_mod script. djoy will also store backups of the changed files.
If the user decides to go back to the old changes before xfce, they can choose to do so.

It might be fun to expose some sub utilities that other projects may like.

Use of djoy would look like this:

```bash
sudo apt install debian-joy
djoy setup
djoy revert
```

# How does this project 'spark joy'?

It tries to only include, or at least emphasize, software that brings joy to me

Rust
- Rust is powerful and is the preferred way to make desktop apps
- Relm

Emacs
- emacs is my preferred editor
- mistydaytheme.el

Xfce
- Lightweight Desktop Environment that has a cute mouse as a logo
- Link for minimal XFCE install: https://git.devuan.org/dev1fanboy/Upgrade-Install-Devuan/wikis/minimal-xfce-install
- The default XFCE debian install includes a lot of software that isn't super necessary.

Papirus
- Flat Icon Theme
```bash
apt install papirus-icon-theme
```

Ion
- Ion Shell
- This is the RedoxOS shell. It is fast, and has a nice syntax.
- It brings me joy, and is part of the transition to more Rust in the OS, so I want to includ it.
- This may involve maintaining the ion-shell package for Debian (i.e. make the package, maybe use debcargo)

Window Manager
- Xfce comes with xfwm4
- Another option is way-cooler, which is written in Rust

Display Manager
- lightdm comes with the xfce4 install, and it is more consistent with xfce's theming.
- gdm looks good, but feels inconsistent with xfce since it uses the gnome-shell

# Dev

Development of Debian Joy is done on QEMU.

```bash
apt install qemu-utils
```

Create hard disk image:
```bash
qemu-img create debian-joy.img 16G
```

Might be able to get away with less.

We need 8G disk space since we are installing XFCE as well as other packages.

Download the current boot image:
```bash
wget http://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso
```

Boot the image with:
```bash
qemu-system-x86_64 -hda debian-joy.img -cdrom debian-testing-amd64-netinst.iso -boot d -m 3G
```

I recommend making a copy of the fresh image so you don't have to wait for the installation in case you want to do a hard reset:
```bash
cp debian-joy.img debian-joy.img.backup
```

Once the installation is complete we can boot the system with:
```bash
qemu-system-x86_64 -hda debian-joy.img -m 3G
```

# Install RVM

Since Debian Joy uses Ruby for all of its scripting and automation, we need a trustworthy way to install Ruby on our system. I've decided to use RVM as my tool of choice for installing Ruby.

We can easily install it like so:
```
./scripts/install_rvm.sh
```

rvm will be added to your path. However, you must make sure that your terminal can run command as login shell. Which can be set in preferences.