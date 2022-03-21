# アプリケーション名
**Aller**

# アプリケーション概要
**「食物アレルギーに特化したコミュニケーション&食事記録アプリ」**<br>
・ツイートやコメントを通して食物アレルギーに関する情報を発信したり、
  取得することができます。<br>
・食事内容を記録することで、何の食材がアレルギーかどのくらいの量で症状が出るかなど
  日々の食事からアレルギーを管理することができます。

# 開発した背景
**自分自身が食物アレルギーを持っており食事への不安やアレルギーへの不安を少しでも解消できたらと思い開発しました。**<br>
食物アレルギーは意外と周りに相談しづらく、学生の頃は特に言いづらかった記憶があります。
おそらく私以外の方も同じことを思っているのではないかと思います。<br>
そのような方々のために食物アレルギーに特化したコミュニケーションの場を作れば、
もっと情報を取得できたり共有することができると感じましたので
食物アレルギーの方、疑いがある方、興味がある方にはぜひ活用して頂きたいです。

# URL
https://aller.herokuapp.com/

# テスト用アカウント
Basic認証パスワード：egg<br>
Basic認証ID：9999<br>
メールアドレス：test@test<br>
パスワード：test1111

# 利用方法
### ツイート(つぶやく)
1.トップページのヘッダーからユーザー新規登録を行う<br>
2.トップページのつぶやくボタンからつぶやく内容(タイトル、内容、画像)を入力し投稿する。<br>
3.トップページへつぶやき一覧が表示されつぶやき詳細へ遷移するとコメントができる。

### 食事管理
1.トップページのヘッダーからユーザー新規登録を行う<br>
2.トップページのサイドバー下部にある記録するボタンから記録内容(日付、時間、年齢、食べた物、量、単位、様子)を入力し登録する。<br>
3.トップページのサイドバーにある記録ボタンから記録一覧ページへと遷移できる。

# 洗い出した要件
要件定義
https://docs.google.com/spreadsheets/d/1Ib3H4wc7gvzvvtNCX9Yekyd6GwmPySua3otuh5PyZXc/edit#gid=982722306

# 実装した機能についての画像やGIFおよびその説明

# 実装予定の機能
①いいね機能<br>
**「ユーザーの利便性向上とアプリケーションの充実性向上」**<br>
・投稿されたツイートにいいねすることができる。<br>
・いいね機能を実装することでユーザーは投稿したツイートに対する反応をもらうことができ、他のユーザーはいいねを通して気軽に反応ができる。<br>
・ユーザーは自分自身がいいねしたツイートを一覧で表示することができる。<br>

②寄付募集機能<br>
**「アプリケーションでの交流を通してユーザーの課題を解決」**
・クラウドファンディングのように企業などが食物アレルギーの方へ向けた開発費や研究費を募集することができる。<br>
・ユーザーは応援したいプロジェクトや開発に寄付をすることができる<br>
**→この機能を実装することで食物アレルギーによって制限されている栄養素などを補う製品を開発することで社会貢献にもつながると考えている**

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/dd659e36e6fc0c274c29723209bc81fd.png)](https://gyazo.com/dd659e36e6fc0c274c29723209bc81fd)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/b4d04e23fe6f2d9e584b1105a04bc1d3.png)](https://gyazo.com/b4d04e23fe6f2d9e584b1105a04bc1d3)

# 開発環境
・マークアップ：html,Scss<br>
・バックエンド：Ruby(Ruby on Rails)<br>
    ・テスト：RSpec<br>
    ・静的コード解析：Rubocop<br>
・データベース：MySQL<br>
・インフラ：heroku<br>
・テキストエディタ：VSCode<br>
・タスク管理：GitHub

# 使用した主なgem
・devise ：ユーザーログイン機能<br>
・active_hash：プルダウンリスト機能<br>
・rubocop：コード解析<br>
・MiniMagick：ImageMagickをRuby使う機能<br>
・ImageProcessing：画像サイズ調整機能

# ローカルでの動作方法
以下のコマンドを順に実行。<br>
% git clone https://github.com/t-tokio/Aller<br>
% cd Aller<br>
% bundle install<br>
% yarn install

# 工夫したポイント
3/25以降に記載


# テーブル設計

## users テーブル

| Column                 | Type    | Options                  |
| ---------------------- | ------- | ------------------------ |
| nickname               | string  | null: false              |
| email                  | string  | null: false,unique: true |
| encrypted_password     | string  | null: false              |
| last_name              | string  | null: false              |
| first_name             | string  | null: false              |
| last_name_kana         | string  | null: false              |
| first_name_kana        | string  | null: false              |
| birthday               | date    | null: false              |
| sex_id                 | integer | null: false              |
| existence_id           | integer | null: false              |
| food_allergy           | string  |                          |

### Association

  has_many :tweets
  has_many :comments
  has_many :likes
  has_many :donation_tweets
  has_many :donations
  has_many :records


## tweets テーブル

| Column         | Type        | Options                       |
| ---------------| ----------- | ----------------------------- |
| title          | string      | null: false                   |
| text           | text        | null: false                   |
| user           | references  | null: false, foreign_key: true|

### Association

  belongs_to :user
  has_many :comments
  has_likes :likes


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| text      | text       | null: false                    |
| tweet     | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet


## likes テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| tweet     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :tweet


## records テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| datetime      | datetime   | null: false                    |
| age_id        | integer    | null: false                    |
| food          | string     | null: false                    |
| quantity      | integer    |                                |
| unit_id       | integer    |                                |
| state_id      | integer    | null: false                    |
| note          | text       |                                |
| user          | references | null: false, foreign_key: true |

### Association

  belongs_to :user


## donation_tweets テーブル

| Column             | Type        | Options                       |
| -------------------| ----------- | ----------------------------- |
| title              | string      | null: false                   |
| text               | text        | null: false                   |
| recruitment_amount | integer     | null: false                   |
| deadline           | integer     | null: false                   |
| user               | references  | null: false, foreign_key: true|

### Association

  belongs_to :user
  has_many :donations


## donations テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| donation_tweet | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |
| amount_id      | integer    | null: false                    |

### Association

- belongs_to :donation_tweet
- belongs_to :user