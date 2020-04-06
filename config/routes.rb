Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  scope '(:locale)', locale: /en|fa/ do
    root 'pages#home'
    get 'about', to: 'pages#about'
    resources :articles
    resources :categories
    resources :users, except: [:new]
    get 'signup', to: 'users#new'
    get 'login', to: 'sessions#new'
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'
  end
end
