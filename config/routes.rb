Rails.application.routes.draw do
  devise_for :users
  
  get '/:name', to: "categories#show", as: :category	
  resources :articles, path: "/:category_name/", controller: 'articles'

  root 'articles#index'
end
