Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
   get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root "posts#index"

  get "myposts", to: "posts#myposts"
  get "preview", to: "export#preview"

  resources :posts do
    resources :comments
  end

  namespace :admin do
    get "myposts", to: "posts#myposts"
    resources :posts do
      resources :comments
    end
  end
end
