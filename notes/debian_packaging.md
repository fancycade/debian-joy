# Debian Packaging

## Building and installing a source code debian package

For example, clone the salsa repository for xfce4.

cd xfce4
debuild
cd ..

# Install the local deb
apt install ./*name-version*_all.deb

# Installing the xyz package

xyz is done with equivs tool.

```bash
equivs-control *file*
```

Change things accordingly.

```bash
equivs-build *file*
```

Then there will be a .deb in the current working directory. That local deb can be installed with:
```bash
sudo apt install ./*name*.deb
```
