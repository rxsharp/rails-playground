Rails.application.routes.draw do
  resources :dev_entries, defaults: { format: 'json' }
  resources :projects
  resources :projects do
    member do
      resources :dev_entries
    end
end
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

end
