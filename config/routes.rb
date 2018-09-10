Rails.application.routes.draw do
  # You can have the root of your site routed with "root"
  root to: 'statics#home'

  # Statics
  get '/about',   to: 'statics#about'
  get '/privacy', to: 'statics#privacy'

  # Contact
  get '/contact', to: 'contact#show', as: :contact
  post '/contact', to: 'contact#deliver'

  # Activity
  resources :activities, only: [:index, :show]

  # Customer
  resources :partners, only: [:index, :show]

  # Target
  resources :targets, only: [:index, :show]

  # Permit
  resources :permits, only: [:index, :show]

  # Feedback
  resources :feedbacks, only: [:index, :show]

  # Article
  resources :articles, only: [:index, :show]

  # Devise + ActiveAdmin
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
