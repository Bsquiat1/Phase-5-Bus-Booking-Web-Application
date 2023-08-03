# db/seeds.rb
require 'faker'

# Admins
admins = Admin.create!([
  { name: 'Admin1', email: Faker::Internet.unique.email, password: 'password1', is_superadmin: true },
  { name: 'Admin2', email: Faker::Internet.unique.email, password: 'password2', is_superadmin: true }
])

# Drivers
drivers = Driver.create!([
  { name: 'Driver1', email: Faker::Internet.unique.email, password: 'password1', admin: admins.first, registration_number: 'ABC123', route: 'Route1' },
  { name: 'Driver2', email: Faker::Internet.unique.email, password: 'password2', admin: admins.last, registration_number: 'XYZ789', route: 'Route2' }
])

# Buses
buses = Bus.create!([
  { name: 'Nairobi Express', number_of_seats: 50, cost_per_seat: 10.5, route: 'Route1', time_of_travel: DateTime.now + 1.day, driver: drivers.first, registration_number: 'ABC123' },
  { name: 'Lake Victoria Shuttle', number_of_seats: 60, cost_per_seat: 12.5, route: 'Route2', time_of_travel: DateTime.now + 2.days, driver: drivers.last, registration_number: 'XYZ789' }
])

# Customers
customers = Customer.create!([
  { name: 'Customer1', email: Faker::Internet.unique.email, password: 'password1', admin: admins.first },
  { name: 'Customer2', email: Faker::Internet.unique.email, password: 'password2', admin: admins.last }
])

# Bookings
bookings = Booking.create!([
  { seat_number: 1, customer: customers.first, bus: buses.first },
  { seat_number: 2, customer: customers.last, bus: buses.last }
])

puts 'Seed data created successfully!'
