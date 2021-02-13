Rails.application.routes.draw do
  devise_for :users
  root to: 'teams#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams, except: [ :edit, :update, :delete ] do
    resources :invites, except: [ :delete, :update, :edit ]
    resources :events,  only: [ :new, :create ]
    # resources :users, only: [ :delete ]
  end

  resources :users, except: [ :delete ] do
    resources :invites, except: [ :delete, :update, :edit ]
  end

  resources :invites, only: [ :edit, :update ]
end
