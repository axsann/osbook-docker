#!/bin/bash
echo "セットアップを開始します。"
echo "途中で「BECOME password:」と表示されたら何も入力せずEnterを押してください。"
read -p "Enterで続行:"

apt update
apt install -y git ansible sudo mtools python3-distutils

cd $HOME

# mikanos-build
git clone https://github.com/uchan-nos/mikanos-build.git osbook
cd $HOME/osbook
# Ubuntu20.04のためlld-7用の旧バージョンを利用
git checkout 8d4882122ec548ef680b6b5a2ae841a0fd4d07a1

# EDK2のセットアップ
cd $HOME/osbook/devenv
ansible-playbook -K -i ansible_inventory ansible_provision.yml

cd $HOME/workspace
# mikanos
git clone https://github.com/uchan-nos/mikanos.git

# MikanLoaderPkgのシムリンク作成（50ページの下部の内容）
cd $HOME/edk2
ln -s $HOME/workspace/mikanos/MikanLoaderPkg ./

cd $HOME/workspace
# make_image.shがエラーになるので修正したファイルをコピー
cp ./scripts/make_image.sh $HOME/osbook/devenv/make_image.sh

cd $HOME/workspace
# EDK2のシムリンクをworkspace内に作成
ln -s $HOME/edk2 ./
# osbookのシムリンクをworkspace内に作成
ln -s $HOME/osbook ./
