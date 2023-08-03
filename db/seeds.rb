# seeds.rb

# Admins
admins = Admin.create!([
  { name: 'Admin1', email: 'admin1@example.com', password_digest: 'password1' },
  { name: 'Admin2', email: 'admin2@example.com', password_digest: 'password2' }
])

# Drivers
drivers = Driver.create!([
  { name: 'Driver1', email: 'driver1@example.com', password_digest: 'password1', admin_id: admins.first.id, registration_number: 'ABC123', route: 'Route1' },
  { name: 'Driver2', email: 'driver2@example.com', password_digest: 'password2', admin_id: admins.last.id, registration_number: 'XYZ789', route: 'Route2' }
])

# Buses
buses = Bus.create!([
  { name: 'Nairobi Express',number_of_seats: 50, cost_per_seat: 10.5, route: 'Route1', time_of_travel: DateTime.now + 1.day, driver_id: drivers.first.id, registration_number: 'ABC123' },
  { name: 'Lake Victoria Shuttle',number_of_seats: 60, cost_per_seat: 12.5, route: 'Route2', time_of_travel: DateTime.now + 2.days, driver_id: drivers.last.id, registration_number: 'XYZ789' }
])

# Customers
customers = Customer.create!([
  { name: 'Customer1', email: 'customer1@example.com', password_digest: 'password1', admin_id: admins.first.id },
  { name: 'Customer2', email: 'customer2@example.com', password_digest: 'password2', admin_id: admins.last.id }
])

# Bookings
bookings = Booking.create!([
  { seat_number: 1, customer_id: customers.first.id, bus_id: buses.first.id },
  { seat_number: 2, customer_id: customers.last.id, bus_id: buses.last.id }
])
puts "done seeding"