# db/seeds.rb

# Seed data for admins
admins = [
  { name: 'Admin 1', email: 'admin1@example.com', password_digest: 'admin1password' },
  { name: 'Admin 2', email: 'admin2@example.com', password_digest: 'admin2password' }
]

Admin.create!(admins)

# Seed data for customers
customers = [
  { name: 'Customer 1', email: 'customer1@example.com', password: 'customer1password', admin: Admin.first },
  { name: 'Customer 2', email: 'customer2@example.com', password: 'customer2password', admin: Admin.first }
]

Customer.create!(customers)

# Seed data for drivers
drivers = [
  { name: 'Driver 1', email: 'driver1@example.com', password: 'driver1password', admin: Admin.first, registration_number: 'DRIVER001', route: 'Route 1' },
  { name: 'Driver 2', email: 'driver2@example.com', password: 'driver2password', admin: Admin.first, registration_number: 'DRIVER002', route: 'Route 2' }
]

Driver.create!(drivers)

# Seed data for buses
buses = [
  { number_of_seats: 50, cost_per_seat: 10.0, route: 'Route 1', time_of_travel: Time.now, driver: Driver.first, registration_number: 'BUS001' },
  { number_of_seats: 40, cost_per_seat: 8.5, route: 'Route 2', time_of_travel: Time.now, driver: Driver.second, registration_number: 'BUS002' }
]

Bus.create!(buses)

# Seed data for bookings
bookings = [
  { seat_number: 1, customer: Customer.first, bus: Bus.first },
  { seat_number: 5, customer: Customer.second, bus: Bus.first }
]

Booking.create!(bookings)
