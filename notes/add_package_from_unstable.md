# Add Package From Unstable

Install dependency:
```bash
sudo apt install software-properties-common
```

Now we can use the `add-apt-repository` command to add the unstable package repository to our sources.list.

```bash
sudo add-apt-repository "deb http://deb.debian.org/debian/ sid main"
```

Now we update:
```bash
sudo apt update
```

Then we add our package:
```bash
sudo apt install bat
```

It isn't considered good a idea to keep this repository still listed so we will remove it:
```bash
add-apt-repository --remove "deb http://deb.debian.org/debian/ sid main"
```

Voila!
