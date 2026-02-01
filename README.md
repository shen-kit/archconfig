# Instructions

1. Install "Minimal" archlinux using `archinstall`
2. Install git and clone this repo
3. Run `cd archconfig/install && ./install.sh`
    - Installs Niri DE and packages
    - Creates symlinks for `~/.*`, `~/.bashscripts`, `~/.config/*`
    - Configures and enables SDDM
    - Enables `power-profiles-daemon`
    - Edits `cron` file
4. Reboot (into Niri)

## Post-Install

1. Configure SSH keys
    - [create SSH key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
    - [add key to github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account?tool=webui#prerequisites)
2. Configure passwords
    - Install keys (save on USB): `gpg --import private.key && gpg --import public.key`
    - Clone `pass` repo
    ```bash
    rm -rf "$HOME/.password-store" || true
    git clone git@github.com:shen-kit/pwd-store.git ~/.password-store
    ```
3. Configure rclone: `rclone config`
