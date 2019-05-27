Check your linux kernel version:
```bash
uname -r
```

If the version displayed is too out of date for your needs, then you can update it with the following steps. It is also recommended to update the linux kernel before you upgrade your debian version.

When upgrading your linux kernel, you want to do it independently of upgrading the debian packages. So the best way to do this is to add the debian backports to your repository sources list.

In this example we will be going over how to upgrade from stretch to buster, but these steps should be applicable for other releases.

```bash
sudo echo "deb http://ftp.debian.org/debian stretch-backports main" >> /etc/apt/sources.list
```

This will add the stretch backports repository to your apt sources list. We now have to let pat now about this change.

```bash
sudo apt update
```

If there are any packages to upgrade, you should do that now.

```bash
sudo apt -t stretch-backports upgrade
```

Now that all of our packages our updated we can find a linux kernel to update.

First search for the list of linux-kernels:
```bash
apt search linux-image
```

You don't want the linux-headers, an rt version, or a cloud version.

In the list find the latest linux kernel, and then we can use apt to install it. For example:
```bash
sudo apt-get -t stretch-backports install linux-image-4.11.0-0.bpo.1-amd64
```

Once this is complete, reboot. Then check the linux version, it should be greater than the original one.
