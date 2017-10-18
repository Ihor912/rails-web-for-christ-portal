Rails.application.routes.draw do
  get '/:name', to: "categories#show", as: :category	
  resources :articles, path: "/:category_name/", controller: 'articles'

  root 'articles#index'
end
