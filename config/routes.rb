Rails.application.routes.draw do
  root "top#index"
  get "about" => "top#about", as: "about"

  1.upto(18) do |n|
    get "lesson/step#{n}(/:name)" => "lesson#step#{n}"
  end
  resources :members do
    #コントローラーの中に会員の検索を行う
    get "search", on: :collection
  end
end
