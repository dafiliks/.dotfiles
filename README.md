# .dotfiles

These are my dotfiles for Arch Linux. I currently do not have an install script for this but I might add one in the future.

# Installing Arch

If you are new to Arch Linux, the link below is a good guide on how to install the OS.

https://github.com/rtxx/arch-minimal-install

# Additional

One setting that I do change for /etc is font properties. This is done by editing `/etc/environment` and appending:
```bash
FREETYPE_PROPERTIES="cff:no-stem-darkening=0 autofitter:no-stem-darkening=0"
```
