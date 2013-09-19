Serooskerke::Application.routes.draw do

  get '/calendar(/:year(/:month))' => 'calendar#index', :as => :calendar, :constraints => {:year => /\d{4}/, :month => /\d{1,2}/}
  resources :comments
  resources :events

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
