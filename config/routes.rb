Rails.application.routes.draw do
  # Authentication
  post '/api/login', to: 'sessions#new'
  post '/api/signup', to: 'registrations#new'
  post '/mpesa/payment', to: 'mpesa#payment'
  # Drivers
  resources :drivers

  # Customers
  resources :customers

  # Buses
  resources :buses

  # Bookings
  resources :bookings

  # Admins
  resources :admins
end
