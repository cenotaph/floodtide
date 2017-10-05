Floodtide::Application.routes.draw do
  
  devise_for :users 
  devise_scope :user do
    get "/admin_sign_in" => "adminuser#new"
  end
  resources :pages
  resources :posts do
    resources :comments
  end
  resources :events do
    collection do
      get :archive
    end
  end
  resources :videos
  resources :users do
    member do
      get :upload_avatar
    end
  end


  mount Ckeditor::Engine => '/ckeditor'
  get '/admin' => 'application#admin'
  get '/admin_sign_in' => 'adminuser#new'
  get '/archive' => 'videos#index'
  get '/about' => 'pages#show', :id => 'about'
  get '/upstream' => 'events#index'
  get '/downstream' => 'events#past'
  post '/search' => 'search#search'
  get '/play' => 'application#play'
  get 'auth/:provider/callback' => 'authentications#create', :via => :get
  get '/oauth/authenticate' => 'authentications#create', :via => :get
  resources :authentications


  root :to => 'application#home'

end
