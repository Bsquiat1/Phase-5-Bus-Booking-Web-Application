Rails.application.routes.draw do
  # Authentication
  post 'login', to: 'authentication#login'

  # Drivers
  resources :drivers, except: [:new, :edit]

  # Customers
  resources :customers, except: [:new, :edit]

  # Buses
  resources :buses, except: [:new, :edit]

  # Bookings
  resources :bookings, except: [:new, :edit]

  # Admins
  resources :admins, except: [:new, :edit]
end
