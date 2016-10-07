Rails.application.routes.draw do

  #Static
  root to: 'static_pages#home'
  get 'home', to: 'static_pages#home', as: 'home'
  get 'about', to: 'static_pages#about', as: 'about'

  # Devise
  devise_for :gardeners
  get 'gardener_root', to: 'tools#index', as: :gardener_root

  #Tools routes
  resources :tools
  resources :requests

  get 'requests/:id/set_approved', to: 'requests#set_approved', as: 'approved'
  get 'requests/:id/set_denied', to: 'requests#set_denied', as: 'denied'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
