Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  devise_for :users

  resources :blog_posts

  # Defines the root path route ("/")
  root "blog_posts#index"

  # Rename the conflicting route to have a inique name
  get 'new_user_session_custom', to: 'devise/sessions#new', as: 'new_user_session_custom'
end
