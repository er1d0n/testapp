class ApplicationController < ActionController::Base
 #セッションデータmember_idに値がセットされていれば該当するMemberオブジェトを返す
 #そうでなければnilを返す
 private def current_member
   Member.find_by(id: session[:member_id]) if session[:member_id]
 end
 #引数に指定された名前のメソッドをテンプレートの中でも使えるメソッド（ヘルパーメソッド）として登録
 helper_method :current_member
end
