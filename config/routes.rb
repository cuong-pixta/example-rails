Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # scope "(:locale)", locale: /en|vi/ do 
  #   root "static_pages#home" 
  # end
  # Ex:- scope :active, -> {where(:active => true)}

  root 'static_pages#home'

  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to:'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
 
end
