Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: "home#index"
  devise_for :users, skip: [:registrations, :sessions]
 
  namespace :api, defaults: { format: 'json' } do
    namespace :v1 do
      devise_for :users, controllers: { sessions: 'api/v1/sessions', registrations: 'api/v1/registrations' } 
      resources :courses
      resources :answers
      resources :questions
    end
  end
end
