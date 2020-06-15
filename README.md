# Temp App

日付と時間を選択し、体温を入力、表で管理するアプリです。 
 


# DEMO
<img width="1156" alt="スクリーンショット 2020-05-11 16 17 57" src="https://user-images.githubusercontent.com/63936582/81549114-34a9d680-93b9-11ea-9267-972441193d77.png">

- [https://temp-application.herokuapp.com/](https://temp-application.herokuapp.com/)

# テスト用アカウント
メールアドレス：test@test
パスワード：testtest


# アプリを作った理由
体温を測り、記録するだけのアプリがなかっため作成しました。
体温測って、記録するだけのシンプルにすることで日々の日課に取り入れやすいと考えました。

# 機能一覧
- ログイン機能
- 体温入力
- グラフによる描画
- 名前検索機能

# 工夫したポイント
シンプルでひとめで全てがわかるようにしました。
ただ数値を入力して数値を表示するのではなく、グラフを描画することで
毎日楽しく記録できることを意識しました。

# 使用技術（開発環境）
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code
JavaScript/jQuery/html/css





# 今後
今後、API導入やプロフィール機能追加などアプリを発展していく予定です。
 

 
# Author
 
* riho0025
 


# データベース設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :records

## recordsテーブル
|Column|Type|Options|
|------|----|-------|
|value|text||
|date |text|null: false｜
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user







