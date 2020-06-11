## アプリ名
Football for everyone

## URL
https://football-for-everyone.herokuapp.com/

## テストアカウント
email: mmm@mmm
<br>
password: mmmmmm
<br>
使用後はログアウトをお願いします。

## なぜ作ったか?
私はサッカーが好きで、よくスタジアムに通っていました。コロナの状況で無観客試合が多くなり、その中でもサッカー好きがコミュニケーションを取れるアプリを作りたいと思い作成しました。また主に以下の三点を念頭に置きながら、作成しました。
### ①スクールで学んだことを活かす
プログラミングスクールに通い多くのことを学びました。インプットするだけでは成長しないので、アウトプットもしようと思いました。なので、スクールで学んだ投稿、編集、削除、コメントなどの機能やテストは最低限実装しました。
### ②スクールで学んだこと以外も実装してみる
受動的に学ぶだけでは成長しないと思ったので、カリキュラム以外のことも入れてみました。youtubeのAPIやsimple calenderを使用してのカレンダー、slickを使ってのスライドショーなどを入れてみました。
### ③１作目よりも綺麗にコードを書いてみる。
１作目のコードはかなりゴチャゴチャしておりました。ですので、リファクタリング出来るところは積極的にリファクタリングして、コードをなるべく省略しました。

## 開発環境
・Ruby(Ruby on rails '5.2.4')
・Haml
・Sass
・jQuery
・Git hub
・Heroku
・My SQL
・Visual Studio Code

## 内容
### トップ画面
slickを使用して、スライドショーを作成しました。
![](https://i.gyazo.com/3b43905b157b00a7314b5a642e1f38de.jpg)
### YouTube 
Youtube APIを使用して動画を観れるようにしました。
![](https://i.gyazo.com/44d83bd45d10c506089100bc1bd3513b.jpg)
### チャット画面
チャットを行えます。非同期通信と自動更新をしております。
![](https://i.gyazo.com/369fc29d6a988f9264dffa392ec88aef.png)
### 試合日程
simple calendarというgemを使い日程を観れるようにしました。
![](https://i.gyazo.com/21c72be914ccefa0803151cd4df08dad.png)
![](https://i.gyazo.com/21df16b50af8d222a9b68efba28de013.png)
### マイページ
マイページでプロフィールを書く事ができます。
![](https://i.gyazo.com/5731ce62645b0eed330b287c2e210b78.png)
### ブログ画面
ブログ画面でもコメントがかけます。いいね機能も実装できます。
![](https://i.gyazo.com/b599558d6758f4f269c3b737f126c8e0.png)
### チーム情報
選手の情報を閲覧できます。
![](https://i.gyazo.com/cec322b138824c58e60b03080ce0a5e8.png)

## 今後実装したい事や課題
フロントエンドをもう少し良くするべきだった。
ユーザーに見やすくする為と思い、シンプルを心掛けましたが、逆にシンプルにし過ぎてしまった。
バックエンドに関してはニュースAPIを使いニュースが観れるようにしたいと思います。

## DB設計
### blogcommentsテーブル
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false|
|blog_id|integer|null: false|
|text|text|null: false|
- belongs_to :user
- belongs_to :blog

### blogsテーブル
|Column|Type|Option|
|------|----|------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|null: false|
- belongs_to :user
- has_many :blogcomments
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

### commentsテーブル
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false|
|team_id|integer|null: false|
|comment|string|null: false|
- belongs_to :user
- belongs_to :team

### gamesテーブル
|Column|Type|Option|
|------|----|------|
|start_time|time|null: false|
|match_id|bigint|null: false|
|home_team_id|bigint|null: false|
|away_team_id|bigint|null: false|
- belongs_to :home_team, class_name: 'Team'
- belongs_to :away_team, class_name: 'Team'
- belongs_to :match

### likesテーブル
|Column|Type|Option|
|------|----|------|
|user_id|integer|null: false|
|blog_id|integer|null: false|
|text|text|null: false|
- belongs_to :user
- belongs_to :blog

### manegersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|birthday|data|null: false|
|nationally|string|null: false|
|team_id|integer|null: false|
- belongs_to :team

### matchesテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|start_time|data|null: false|
- has_many :games

### playersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|position|string|null: false|
|footed|string|null: false|
|height|integer|null: false|
|weight|integer|null: false|
|uniform_umber|integer|null: false|
|birthday|data|null: false|
|nationally|string|null: false|
|team_id|integer|null: false|
- belongs_to :team

### teamsテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|home|string|null: false|
|stadium|string|null: false|
|founding_year|integer|null: false|
|image_id|string|null: false|
- attachment :image
- has_many :comments
- has_many :user_teams
- has_many :users, through: :user_teams
- has_many :players
- has_one :maneger
- has_many :home_team_games, class_name: 'Game'
- has_many :away_team_games, class_name: 'Game'

### usersテーブル
|Column|Type|Option|
|------|----|------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|admin|boolean|default: false|
|profile|text||
- has_many :comments, dependent: :destroy
- has_many :user_teams, dependent: :destroy
- has_many :teams, through: :user_teams, dependent: :destroy
- has_many :blogs, dependent: :destroy
- has_many :blogcomments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_blogs, through: :likes, source: :blog