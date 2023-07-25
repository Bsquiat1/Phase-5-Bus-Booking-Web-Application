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

  # Additional routes can be added here for other custom functionality.

  # Root route (optional)
  # root 'buses#index'
end
