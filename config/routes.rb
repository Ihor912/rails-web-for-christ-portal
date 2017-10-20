Rails.application.routes.draw do
  devise_for :users
  
  get '/:name', to: "categories#show", as: :category	
  resources :articles, path: "/:category_name/", controller: 'articles'
  resources :questions do
    collection do
      get :index_all_not_approved
    end
    get :approve, :on => :member
    get :disapprove, :on => :member
  end

  root 'articles#index'
end
