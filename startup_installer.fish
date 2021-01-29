#!/bin/bash

# 時間を日本の標準時と合わせる
sudo ntpdate ntp.nict.jp

# mirrorの変更とシステムアップデート
sudo pacman-mirrors --fasttrack
yes | sudo pacman -Syy && sudo pacman -Syyu

# 日本語入力環境
yes | sudo pacman -S fcitx-im fcitx-mozc fcitx-configtool
set ex 'export'
set mo 'XMODIRIER'
set addtions -e "\
$ex LANG=\"ja_JP.UTF-8\"
$ex $mo\S=\"@im=fcitx\"
$ex $mo=\"@im=fcitx\"
$ex GTK_IM_MODULE=fcitx
$ex QT_IM_MODULE=fcitx
$se DefaultIMModule=fcitx"

set fileName '/.xprofile'
echo $addtions >> $HOME$fileName

# ディレクトリ名の変更
yes | sudo pacman -S xdg-user-dirs-gtk
LANG=C xdg-user-dirs-gtk

# logout
logout

