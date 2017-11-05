Rails.application.routes.draw do
  devise_for :users
  
  get '/tags/new', to: "tags#new"
  get '/tags/:link_name/edit', to: "tags#edit"
  patch '/tags', to: "tags#update"
  delete '/tags/:link_name', to: "tags#destroy"
  get '/tags/:link_name', to: "tags#show"
  
  get '/articles/new', to: "articles#new"
  get '/articles/:link_name', to: "articles#show"
  get '/articles/:link_name/edit', to: "articles#edit"
  patch '/articles', to: "articles#update"
  delete '/articles/:link_name', to: "articles#destroy"
  resources :articles
  resources :tags
  resources :questions do
    collection do
      get :index_all_not_approved
    end
    get :approve, :on => :member
    get :disapprove, :on => :member
  end

  root 'articles#index'
end
