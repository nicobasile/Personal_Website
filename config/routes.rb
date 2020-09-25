Rails.application.routes.draw do
    root to: 'pages#home'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users do
        resource :profile
    end
    get 'about', to: 'pages#about'
    get 'community', to: 'pages#community'
    get 'projects', to: 'pages#projects'
    get 'projects/KitchenSync', to: 'projects#KitchenSync'
    get 'projects/ZealotStrike', to: 'projects#ZealotStrike'

    resources :contacts, only: :create
    get 'contact-me', to: 'contacts#new', as: 'new_contact'
end
