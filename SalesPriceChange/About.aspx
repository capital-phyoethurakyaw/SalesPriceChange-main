<%@ Page Title="About Us" Language="C#"  MasterPageFile="~/SalePriceMaster.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="SalesPriceChange.About" %>


<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="head">
         
  <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/jquery-3.2.0.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap.min.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-hover-dropdown.js") %>"></script> 
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-datetimepicker.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/bootstrap-datetimepicker.fr.js") %>"></script>
    <script type="text/javascript" src="<%= Page.ResolveClientUrl("~/Scripts/Scripts/jquery-1.8.3.min.js") %>"></script>
    <style type="text/css">
        ul {
  list-style:circle;
  padding-left: 40px;
  color:#337AB7;
}
ol {
  list-style:square;
  padding-left: 40px;
  color:#337AB7;
  font-weight:bold;
}
        li {
            padding-top:3px;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">

    <div style="text-align:center">
    <p style="font-size:30px; color:#337AB7;font-weight:bold;padding-top:30px;"">
      指示書システム( VERSION 1.8 ) 1-12-2021
    </p>
    </div>
     <div style="padding-top:30px;">
             <ol>
                     <li>
                       今回の V-1.8 バージョンに下記のことを追加いたしました。
                         <ul>
                             <li>過去は　"更新" ボータンを　押すと　"g-1000000043-156026@mail.talknote.com" のメールアドレスに　送信されてるけど、現在は　"d030e977.act-gr.co.jp@jp.teams.ms"のメールアドレスに　送信するように　変更しました。</li>
                            
                         </ul>


                    </li>
             </ol>
    </div>
        <div style="text-align:center">
    <p style="font-size:30px; color:#337AB7;font-weight:bold;padding-top:30px;"">
      指示書システム( VERSION 1.7 ) 1-10-2018
    </p>
    </div>
     <div style="padding-top:30px;">
             <ol>
                     <li>
                       今回の V-1.7 バージョンに下記のことを追加いたしました。
                         <ul>
                             <li>ＭＤ管理表一覧の指定日残額コラムと残額(税抜)コラムにゼロ無しチェックと全部のチェックを選択して検索するように修正しました。</li>
                             <li>補填管理表一覧にコラム名を変更すると開始日と終了日を追加しました。</li>
                             <li>指示書新規作成にユーザーはフォームを削除できないことのエラーを修正しました。</li>
                             <li>テーマ設定を変わるようにデザインテンプレートにトグルスイッチを追加しました。</li>
                         </ul>


                    </li>
             </ol>
    </div>

    <div style="text-align:center">
    <p style="font-size:30px; color:#337AB7;font-weight:bold;padding-top:30px;"">
      指示書システム( VERSION 1.6 ) 13-2-2018
    </p>
    </div>
     <div style="padding-top:30px;">
             <ol>
                     <li>
                       今回の V-1.6 バージョンに下記のことを追加いたしました。
                         <ul>
                             <li>指示書画面に削除ボタンを追加しました。作成者以外は操作しないようにしました。</li>
                             <li>-指示画面をモービルでできるようにデザインを調整しておりました。</li>
                             <li>-画面から出力されたCSVファイルに下記のように修正しました。ファイルのヘーダテキストを日本語で変換される。承認日欄を追加する。</li>
                             <li>-IEで動かないエラー【例外エラー、デザインエラー】を修正すること。</li>
                             <li>-MD_management画面に削除ボタンを追加しました。</li>
                         </ul>


                    </li>
             </ol>
    </div>


    <div style="text-align:center">
    <p style="font-size:30px; color:#337AB7;font-weight:bold;padding-top:30px;"">
      指示書システム( VERSION 1.5 )
    </p>
    </div>
     <div style="padding-top:30px;">
             <ol>
                     <li>
                       今回のバージョンに下記のことを追加いたしました。
                         <ul>
                             <li>-指示テンプレートにある【価格変更】テキストボックスにマルチテキストモードとして修正しました。</li>
                             <li>-ヘーダにある【開始日】欄を押下する場合ソーティングできるように修正しました。</li>
                             <li>-ロジックエラー対応【メールを送信する場合相手先が違うこと】 原因：新しい画面を作成するとき発生しました。 </li>
                             <li>-ユーザからアップ、ダウンロード、削除処理を行うため新機能を追加しました。 アップされたファイルを削除、ダウンロードについてのユーザ管理はまだです。 どのユーザタイプでもできる状態になっております。</li>
                             <li>‐今回には画面のデザインを特に修正しませんでした。</li>
                             <li>-命令リスト形式での現在のステージ行の完了</li>

                         </ul>


                    </li>
             </ol>
    </div>

<div style="text-align:center">
    <p style="font-size:30px; color:#337AB7;font-weight:bold;padding-top:30px;"">
      指示書システム( VERSION 1.4 )
    </p>
</div>
    <div style="padding-top:30px;">
    <ol>
        <li>
            全画面共通
            <ul>
                <li>デザインを修正する。</li>
                <li>マイナーなバグを修正する。</li>
            </ul>
        </li>
        <li>
            ホーム
            <ul>
                <li>申請番号順（降順）に並べました。</li>
            </ul>
        </li>
        <li>
            申請番号管理表（指示書一覧）
            <ul>
                <li>指示書新規作成ボタンを追加しました。</li>
                <li>申請番号順（降順）に並べました。</li>
                <li>指示書新規作成画面の「仕入先」の下にある｢カテゴリ」に手入力した内容を表示しました。</li>
            </ul>
        </li>
        <li>
            指示書新規作成
            <ul>
                <li>申請区分の横の「カテゴリ」を消しました。</li>
                <li>「申請区分、仕入先、ブランド、特記フラグ、」管理画面の順番通りに変更しました。</li>
                <li>商品管理/チェックに択項目肢を消しました。</li>
            </ul>
        </li>
        <li>
            ＭＤ管理表
            <ul>
                <li>「合計金額」の項目を追加ししました。</li>
            </ul>
        </li>
        <li>
            管理画面
            <ul>
                <li>カテゴリエントリを消しました。</li>
                <li>ユーザー一覧に「編集」を「削除」に修正しました。</li>
            </ul>
        </li>
    </ol>
</div>
<div style="text-align:center">
    <p style="font-size:30px; color:#337AB7;font-weight:bold;padding-top:30px;"">
      指示書システム( VERSION 1.3 )
    </p>
</div>
<div style="padding-top:30px;">
    <ol>
        <li>
          全画面共通
          <ul>
            <li>カレンダー選択を日本語表記に変更(例:2017年9月)</li>
            <li>管理画面に削除の機能を追加しました。</li>
          </ul>
        </li>
        <li>
            ホーム
            <ul>
                <li>全部のタスクと自分のタスクを選択できるようにやりました。</li>
            </ul>
        </li>
        <li>
            申請番号管理表（指示書一覧）
            <ul>
                <li>申請区分の右に「カテゴリ」を表示、全体的に列幅を狭くして一面で全て表示されるようにやりました。</li>
                <li>検索パネルに「仕入先、ブランド、申請区分」を選択項目肢で選べるようにやりました。</li>
            </ul>
        </li>
        <li>
            指示書新規作成
            <ul>
                <li>「カテゴリ、価格変更備考、仕入担当メモ、商品管理メモ、社長メモ」を左揃えに変更に更新しました。</li>
                <li>「特記」を「特記フラグ」に名称変更しました。</li>
                <li>メール本文の内容を更新しました。</li>
            </ul>
        </li>
        <li>
            ＭＤ管理表
            <ul>
                <li>指示書作成画面でＭＤ管理表：「要」にチェックされた物全てを表示するように更新しました。</li>
                <li>左上の名称に表示された「補填管理表一覧」を「ＭＤ管理表一覧」に変更しました。</li>
                <li>開始日の右に「すご楽承認日」を追加しました。</li>
                <li>「経験処理」を「経理処理」に更新しました。</li>
                <li>残額（税抜）(Tax_Exclude)に(Tax_Exclude)を消しました。</li>
                <li>仕入処理日項目を消しました。</li>
                <li>金額（税抜）(Tax_Exclude)に(Tax_Exclude)を消しました。</li>
                <li>編集とき、「すご楽承認日」を追加して、カレンダーで入力できるようにやりました。</li>
                <li>編集とき、「経験処理」を「経理処理」に更新しました。</li>
                <li>編集とき、仕入処理日項目を消しました。</li>
                <li>備考の枠を広げりました。</li>
                <li>検索パネルに「仕入先、ブランド」を選択項目肢で選べるようにしました。</li>
                <li>検索パネルに「納品書日付-から」、「納品書日付-に:」、「仕入処理日-から:」、「仕入処理日-に:」を納品書日付：○○○○～○○○○、すご楽承認日付：○○○○～○○○○に更新しました。</li>
                <li>検索パネルに「開始日」を追加して、カレンダーで入力できるようにやりました。</li>
                <li>検索パネルに｢すご楽承認日」を追加して、カレンダーで入力きるようにやりました。</li>
                <li>検索パネルに「経理処理」を追加して、手入力きるようにやりました。</li>
            </ul>
        </li>
        <li>
            補填管理表
            <ul>
                <li>編集とき、選択項目肢は「未」、「完了」の順に変更しました。</li>
            </ul>
        </li>
    </ol>
</div>

<div>
    <p style="text-align:center; top:400px;"> Capital Knowledge Myanmar</p>
    <p style="text-align:center; top:420px;">
        <img src="Images/11140079_1632197250333718_8925207411363483344_n.jpg" /> </p>
</div>
</asp:Content>
