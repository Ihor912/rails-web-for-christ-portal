Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :articles
  end
  root 'articles#index'
end
