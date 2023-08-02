Rails.application.routes.draw do
  # Routes for BusesController
  resources :buses do
    collection do
      get 'search_by_route', to: 'buses#search_by_route'
    end
  end

  # Routes for DriversController
  resources :drivers

  # Routes for CustomersController
  resources :customers

  # Routes for BookingsController
  resources :bookings

  # Authentication routes
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Root route (optional)
  # root 'buses#index'
  #Routes for admins_controller
  resources :admins
  
end
