class SessionsController < ApplicationController
  def create
    #送信された名前に合致するメンバーを取り出し、変数memberにセットする
    member = Member.find_by(name: params[:name])
    #authenticateメソッドで送信されたパスワードが正しいかどうかをチェックする
    #ボッチ演算子(&.)でエラーを防ぐ
    if member&.authenticate(params[:password])
      #パスワードが正しい場合は、Memberオブジェクトのidをセッションデータmember_idに保存する
      session[:member_id] = member.id
    else
      #正しくない場合は、フラッシュで警告メッセージを表示する
      flash.alert = "名前とパスワードが一致しません。"
    end
    #トップページにリダイレクトする
    redirect_to :root
  end
  #セッションデータをクリアし、トップページにリダイレクトする
  def destroy
    session.delete(:member_id)
    redirect_to :root
  end
end
