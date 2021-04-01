Rails.application.routes.draw do
  concern :api_base do
    resources :employees, only: [:index, :create, :update, :destroy, :show]
    resources :managers, only: [:index, :create, :update, :destroy, :show]
  end

  namespace :v1 do
    concerns :api_base
  end
end
