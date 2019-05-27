# Debian Joy Project

Project originated by Harley Swick, to make the usage, development of GNU/Linux and Free Software in general more joyful.

This idea of joy is heavily inspired by the Ruby philosophy of developer happiness.

# How does this project 'spark joy'?

It tries to only include, or at least emphasize, software that brings joy to me

This includes:
Ruby + Rake
- Idea is to use Rake for build tools, and other automation

Rust
- Rust is powerful and is the preferred way to make desktop apps
- Relm

Emacs
- emacs is my preferred editor
- mistydaytheme.el

Xfce
- Lightweight Desktop Environment that has a cute mouse as a logo

Papirus
- Flat Icon Theme
apt install papirus-icon-theme

# Dev

Development of Debian Joy is done on QEMU.

```bash
apt install qemu-utils
```

Create hard disk image:
```bash
qemu-img create debian-joy.img 4G
```

We need 4G disk space since we are installing XFCE as well as other packages.

Download the current boot image:
```bash
wget http://cdimage.debian.org/cdimage/daily-builds/daily/arch-latest/amd64/iso-cd/debian-testing-amd64-netinst.iso
```

Boot the image with:
```bash
qemu-system-x86_64 -hda debian-joy.img -cdrom debian-testing-amd64-netinst.iso -boot d -m 512
```

Once the installation is complete we can boot the system with:
```bash
qemu-system-x86_64 -hda debian-joy.img -m 512
```

# Install RVM

Since Debian Joy uses Ruby for all of its scripting and automation, we need a trustworthy way to install Ruby on our system. I've decided to use RVM as my tool of choice for installing Ruby.

We can easily install it like so:
```
./scripts/install_rvm.sh
```

rvm will be added to your path. However, you must make sure that your terminal can run command as login shell. Which can be set in preferences.