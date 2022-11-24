
# ブートローダーのビルドに必要なedk2/Conf/target.txtの生成方法
```
$ cd $HOME/edk2
$ source edksetup.sh
```

- Conf/target.txtの生成後、手動で以下に書き換える。

```

ACTIVE_PLATFORM = MikanLoaderPkg/MikanLoaderPkg.dsc
TARGET = DEBUG # デフォルトのまま
TARGET_ARCH = X64
TOOL_CHAIN_TAG = CLANG38
```

# ブートローダーのビルド方法（target.txtの作成後）
```
$ cd $HOME/edk2
$ source edksetup.sh
$ build
```

# mikanosのビルドに必要な環境変数の読み込み方
```
$ source $HOME/osbook/devenv/buildenv.sh
```
