# wordpress-skeleton

VCCWをベースとしたWordPressサイトのスケルトン


## Vagrantの準備

```
$ brew cask install virtualbox vagrant
$ vagrant plugin install vagrant-hostsupdater
```


## VMの初期化

```
$ git clone git@github.com:mgaoshima/wordpress-skeleton.git
$ cd wordpress-skeleton
$ rm -rf .git && git init && git add -A && git c -m init
$ vagrant up
```

hostsを書き換えるために、途中でパースワード入力があります。


## 初期化時に起こること

1. 仮想マシン（VM）の立ち上げ
1. 仮想マシンのLAMP環境化
1. 開発ツールの導入（wp-cli,grunt,etc...）
1. WordPressのインストール
1. WordPressの初期設定


## VMのサスペンド／レジューム

```
$ vagrant suspend   # 停止
$ vagrant resume    # 再開
```


## VMの停止／破棄

```
$ vagrant halt      # 停止（DBが破棄されます）
$ vagrant destroy   # 破棄（VMもDBも破棄されます）
```


## DBデータをvagrantからエクスポート

```
$ ./db_pull.sh      # => sqldump.sql
```


## DBデータをvagrantに反映

```
$ ./db_push.sh
```


## 設定を変更するには

- site.yml ... 初期化時の設定（`vagrant provision` で走る）
- provision-post.sh ... 初期化後の設定（`vagrant provision --provision-with shell` で再度走る）

`vagrant provision`が失敗するときは他のVMが動いてないかチェックする

```
$ vagrant global-status           # 動いているVMを確認
$ vagrant global-status --prune   # ルートディレクトリが存在しないVMを破棄
```

Vagrantの詳しい使い方はこちら => [Vagrantドキュメント](http://lab.raqda.com/vagrant/)

## とりあえず適当なテスト用データを入れたいとき

[テーマユニットテストデータ（日本語版）](https://github.com/jawordpressorg/theme-test-data-ja)
