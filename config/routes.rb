Serooskerke::Application.routes.draw do

  resources :comments

  resources :surroundings do
  	resources :photos
  end

  devise_for :admins

  resources :impressions do
  	resources :pictures
  end

  get "pages/home"

  root 'pages#home'

  match 'contact' => 'contact#new', :via => :get
  match 'contact' => 'contact#create', :via => :post
end
