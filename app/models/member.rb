class Member < ApplicationRecord
  #引数の検索ワードが空でなければSQLのLIKEを使ってユーザー名または氏名から検索するリレーションオブジェクトを作成
  class << self
    def search(query)
      #numberカラムでソートするという設定をもつリレーションオブジェクトが変数rel二セットされる
      rel = order("number")
      #リレーションオブジェクトに「nameカラムまたはfull_nameカラムを対象にレコードを絞り込む」という設定を追加
      if query.present?
        rel = rel.where("name LIKE ? OR full_name LIKE ?",
          "%#{query}%", "%#{query}%")
    end
    #メソッドの戻り値
    rel
  end
 end
end
