class Member < ApplicationRecord
  #会員情報の検証(背番号)
  validates :number, presence: true,
   numericality: {
     only_integer: true, #整数のみ
     greater_than: 0, #1以上100未満
     less_than: 100,
     allow_blank: true #presence:trueとの重複を避けるため
   },
   uniqueness: true

   #会員情報の検証（ユーザー名）
   validates :name, presence: true,
    format: { with: /\A[A-Za-z][A-Za-z0-9]*\z/, allow_blank: true },
    length: { minimum: 2, maximum: 20, allow_blank: true },
    uniqueness: { case_sensitive: false }

    #会員情報の検証（氏名）
    validates :full_name, presence: true, length: { maximum: 20 }

    #会員情報の検証（Email）
    validates :email, email: { allow_blank: true }

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
