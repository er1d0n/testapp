Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"

  #Lessonコントローラのstep1~18までのアクションを呼び出す
1.upto(18) do |n|
  get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
end

resources :members #Ｍｅｍｂｅｒｓコントローラに対して７つのアクションのルーティングが設定可能になる

end
