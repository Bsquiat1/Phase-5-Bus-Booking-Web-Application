Rails.application.routes.draw do
  # Authentication
  get '/login', to: 'sessions#new', as: :login
  get '/signup', to: 'registrations#new', as: :signup
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
  #routes 
resources :routes, only: [:index,:show], path: 'routes'

end
