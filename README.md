# wordpress-skeleton

VCCWをベースとしたWordPressサイトのスケルトン


## VMの初期化

```
$ vagrant up
```


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
