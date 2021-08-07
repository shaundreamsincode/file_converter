Rails.application.routes.draw do
  resources :conversions, only: :create
end
