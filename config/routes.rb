Rails.application.routes.draw do
    root to: 'pages#home'
    devise_for :users, controllers: { registrations: 'users/registrations' }
    resources :users do
        resources :profile
    end
    get 'about', to: 'pages#about'
    get 'subscription', to: 'pages#subscription'
    resources :contacts, only: :create
    get 'contact-me', to: 'contacts#new', as: 'new_contact'
end
