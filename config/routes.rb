Rails.application.routes.draw do  

  get "login" => "users#login_form"
  post "login" => "users#login"
  post "logout" => "users#logout"

  post "users/create" => "users#create"
  get "users/:id" => "users#show"
  get "signup" => "users#new"

  resources :posts do
    resources :likes, only: [:create, :destroy]
  end
  
  get "/" => "home#top"
  get "home/usa" => "home#usa"
  get "home/uk" => "home#uk"
  get "home/canada" => "home#canada"
  get "home/australia" => "home#australia"
  get "home/newzealand" => "home#newzealand"
  get "home/southafrica" => "home#southafrica"
  get "home/malta" => "home#malta"
  get "home/philippines"
  
end