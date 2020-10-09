## 📗体調管理アプリ　COCOLOGUE（こころーぐ）

自分の体調を把握したい人のための体調記録サービスです。[こちら](https://coco-logue.herokuapp.com/login)からアクセスできます。

体調を５段階で記録し、その推移をグラフで振り返ることができます。その他にも、日記の投稿・表示が可能です。

<img src="https://i.gyazo.com/9639558bd3193ba96461794cc855cd9b.png" width="50%">





<img src="https://i.gyazo.com/170aae0d5c6bdc81ddec18ddb69f48fd.png" width="30%" height="10%">



## 📗APP URL

### **https://coco-logue.herokuapp.com/login**

<<<<<<< HEAD
<br>
=======

>>>>>>> fb0d3fed2378896a47b84e537357f8b5e9264177

## 📗アプリの機能

------

#### **1. ユーザ登録・ログイン/ログアウト機能**

<img src="https://i.gyazo.com/2975dc7204dcf95bac3a5f918443745a.png" width="75%" height="100%">



#### **2. 日記を投稿**

<img src="https://i.gyazo.com/eec05fc863bbf686ea69a19e85acd313.png" width="75%">

体調の項目として、活動・気分・食欲それぞれについて５段階で記録する。

<<<<<<< HEAD
<br>
=======

>>>>>>> fb0d3fed2378896a47b84e537357f8b5e9264177

#### **3. 日記の一覧を表示**

<img src="https://i.gyazo.com/086a43044e86cde44b38b4eaea24026f.png" width="75%">



#### **4. 体調グラフ機能**

<img src="https://i.gyazo.com/268ab0008f8d968da773861591de6074.gif" width="75%">



## 📗使用している技術

<<<<<<< HEAD
=======
------

>>>>>>> fb0d3fed2378896a47b84e537357f8b5e9264177
- HTM/CSS
-  Chart.js
- jQuery
- Ruby
- Ruby on Rails（MVCを用いたコーディング）
- デバッグツール（pry-byebug)
- Git（バージョン管理ツール）
- Heroku（Paas)
- Atom（エディタ）
- iTerm （ターミナル）



## 📗環境構築

- OSはMacを前提とします。(macOS Mojaveにて動作確認)
- Ruby 2.6.5p114
- Rails 5.2.3
- Bundler 2.0.2
- MySQL  8.0.19

- Rubyのビルドに必要なパッケージ導入にはHomebrew, Gemに関してはBundlerを使用。

- [こちら](https://dev.classmethod.jp/articles/build-ruby-environment-by-rbenv/)の記事をマニュアルとして環境構築をお願いいたします。



## 📗使用方法

GithubからローカルへアプリケーションをCloneします。

```bash
$ git clone https://github.com/akira5316/cocologue.git
```



Cloneしたアプリケーションで使用するGemをインストールします。

```bash
$ bundle install
```



データベースを作成します。

```bash
$ rails db:create
$ rails db:migrate
```



アプリケーションを起動します。以下のような表示が出れば成功です。

```bash
$ rails s

=> Booting Puma
=> Rails 5.2.3 application starting in development
=> Run `rails server -h` for more startup options
Puma starting in single mode...
* Version 3.12.1 (ruby 2.6.5-p114), codename: Llamas in Pajamas
* Min threads: 5, max threads: 5
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop
```



ブラウザからアクセスします。

http://localhost:3000
