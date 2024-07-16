Rails.application.routes.draw do
  devise_for :admins
  post '/contact', to: 'contacts#create', as: 'contact'
  get 'blog', to: 'blog_posts#index'
  get 'portfolio', to: 'portfolio#index'
  get 'about_me', to: 'about_me#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  

  
  devise_for :users

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # Defines the root path route ("/")
  root "pages#index"
end
