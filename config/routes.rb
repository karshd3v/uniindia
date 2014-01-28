Uniindia::Application.routes.draw do
  
  root 'pages#home'

  get "categories/show"
  get "constituencies/show"
  get "comments/create"
  get "about" => "pages#about", as: :about
  get "contact" => "pages#contact", as: :contact
  get "victim", to: "pages#victim"
  get "volunteer", to: "pages#volunteer"
  resources :constituencies, only: [:show]
  resources :categories, only: [:show]
  resources :images

  get "/conversations", to: "conversations#index", as: :conversations
  get "/conversations/:id", to: "conversations#show", as: :conversation
  post "/conversations/:id", to: "conversations#message", as: :new_message
  post "/conversations", to: "conversations#create", as: :new_conversation

  devise_for :users, skip: [:sessions,:passwords,:registrations]
  devise_for :mlas, skip:[:sessions,:passwords,:registrations]

  devise_scope :mla do
    get 'mla/signin' => 'devise/sessions#new', :as => :new_mla_session
    post 'mla/signin' => 'devise/sessions#create', :as => :mla_session
    delete 'mla/signout' => 'devise/sessions#destroy', :as => :destroy_mla_session
  end

  get "request/:id/archive" => "archive#show", as: :archive_request
  post "request/:id/archive" => "archive#delete"
  post "request/:id/unarchive" => "archive#unarchive"
  get "requests/archive" => "archive#index", as: :archive

  devise_scope :user do
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  devise_scope :user do
    get "/signup", to: "users/registrations#new", as: :new_user_registration
    post "/signup", to: "users/registrations#create", as: :user_registration
  end

  
  get "/settings", to: "profile#edit", as: :setting
  put "/settings", to: "profile#update", as: :setting_update
  patch "/settings", to: "profile#update", as: nil
  
  get "/:user_name", to: "profile#index", as: :profile
  get "/:user_name/analytics", to: "profile#analytics", as: :analytics
  

  post "/request/:id/vote", to: "requests#vote",  as: :vote
  post "/request/:id/interest", to: "requests#interest",  as: :interest


  resources :requests, only: [:show,:new,:create] do
    resources :comments, only: [:create]
  end

end