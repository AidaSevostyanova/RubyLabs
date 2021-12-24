Rails.application.routes.draw do
  devise_for :admins
  root 'labs#index'

  resources :labs

  get '/labs/:id/mark', to: 'labs#mark', as: 'mark_lab'

  post '/labs/:id/mark', to: 'labs#grade'
end
