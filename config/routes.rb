Rails.application.routes.draw do 

  get "contact/new" => "contact/new"
  post "contact/confirm" => "contact/confirm"
  post "contact/thanks" => "contact/thanks"

  devise_for :users

  resources :users, only: [:show]

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
  get "home/terms" => "home#terms"
  get "home/privacy" => "home#privacy"
  
end