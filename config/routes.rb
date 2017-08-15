Rails.application.routes.draw do
  devise_for :users

  resources :registered_applications

  namespace :api, defaults: { format: :json } do
    match '/events', to: 'events#preflight', via: [:options]
    resources :events, only: [:create]
  end

  get 'welcome/index'

  get 'welcome/about'

  root 'welcome#index'

end
