#!/bin/bash

# 時間を日本の標準時と合わせる
sudo ntpdate ntp.nict.jp

# mirrorの変更とシステムアップデート
yes | sudo pacman-mirrors --fasttrack && sudo pacman -Syyu

# 日本語入力環境
yes | sudo pacman -S fcitx-im fcitx-mozc fcitx-configtool
mv .xprofile $HOME/

# ディレクトリ名の変更
yes | sudo pacman -S xdg-user-dirs-gtk
LANG=C xdg-user-dirs-gtk

# logout
logout

