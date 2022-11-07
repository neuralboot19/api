Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :users, :controllers => { sessions: 'users/sessions' }.merge(ActiveAdmin::Devise.config)
  devise_for :customers
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      namespace :customers do

        get 'show', to: 'customers#show'
        post 'point', to: 'customers#point'
        match 'close' => 'customers#close', via: [:post, :patch, :put, :delete]

        resources :games, only: [:index, :show]
        resources :operations, only: [:index]
        # resources :options, only: [:index]

        devise_scope :customer do
          post 'facebook', to: 'providers#facebook'
          delete 'logout', to: 'sessions#destroy_session'
        end

      end
    end
  end

  root 'welcome#index'
  get 'privacy', to: 'welcome#privacy'
end
