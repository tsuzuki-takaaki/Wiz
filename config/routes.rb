Rails.application.routes.draw do 

  resources :users, only: [:show, :new, :create] do
    collection do
      get "login_form"
      post "login"
      post "logout"
    end
  end

  resources :posts, only: [:create, :new, :edit, :show, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  
  root "home#top"
  get "home/usa" => "home#usa"
  get "home/uk" => "home#uk"
  get "home/canada" => "home#canada"
  get "home/australia" => "home#australia"
  get "home/newzealand" => "home#newzealand"
  get "home/southafrica" => "home#southafrica"
  get "home/malta" => "home#malta"
  get "home/philippines" => "home#philippines"
  
end