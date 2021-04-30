Rails.application.routes.draw do

  #homecontroller
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
