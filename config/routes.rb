Rails.application.routes.draw do
  devise_for :users do
    get "/sign_up" => "devise/registrations#new", as: "new_user_registration"
  end
  # root to: 'teams#index'
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :teams, except: [:delete] do
    resources :invites, except: %i[delete update edit]
    resources :events,  only: %i[new create]
    # resources :users, only: [ :delete ]
  end

  resources :users, except: [:delete] do
    resources :invites, except: %i[delete update edit]
  end

  get '/users/:id/edit_schedule' => 'users#edit_schedule', as: :edit_schedule
  patch '/users/:id/edit_schedule' => 'users#edit_schedule'

  resources :invites, only: %i[edit update]
end
