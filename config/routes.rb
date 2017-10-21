Rails.application.routes.draw do
  devise_for :users
  
  get '/tags/:link_name', to: "tags#show", as: :tag
  get '/articles/new', to: "articles#new"
  get '/articles/:link_name', to: "articles#show"
  get '/articles/:link_name/edit', to: "articles#edit"
  patch '/articles', to: "articles#update"
  delete '/articles/:link_name', to: "articles#destroy"
  resources :articles
  resources :questions do
    collection do
      get :index_all_not_approved
    end
    get :approve, :on => :member
    get :disapprove, :on => :member
  end

  root 'articles#index'
end
