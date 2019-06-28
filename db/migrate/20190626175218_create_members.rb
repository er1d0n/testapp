class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.integer :number, null: false                        #背番号
      t.string :name, null: false                           #ユーザー名
      t.string :full_name                                   #本名
      t.string :email                                       #メアド
      t.date :birthday                                      #生年月日
      t.integer :sex, null: false, default: 1               #性別（１：男、　２：女）
      t.boolean :administrator, null: false, default: false #管理者フラグ
      t.timestamps
    end
  end
end
