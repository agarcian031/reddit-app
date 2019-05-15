Rails.application.routes.draw do
  root "subs#index"

  # Resource routing 
  resources :subs do  #name of the controller 
    resources :topics
  end  

  # Regular routing 
  # get "/subs", to: "subs#index"
  # get "/subs/:id", to: "subs#show"
  # delete "/subs/:id", to: "subs#destroy"
end
