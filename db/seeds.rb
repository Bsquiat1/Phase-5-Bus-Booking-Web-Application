# Clear existing data
Booking.destroy_all
Customer.destroy_all
Bus.destroy_all
Driver.destroy_all

# Create drivers
driver1 = Driver.create(name: 'John Doe', email: 'john@example.com', password: 'password123', password_confirmation: 'password123')
driver2 = Driver.create(name: 'Jane Smith', email: 'jane@example.com', password: 'password456', password_confirmation: 'password456')

# Create customers
customer1 = Customer.create(name: 'Alice Johnson', email: 'alice@example.com', password: 'password789', password_confirmation: 'password789')
customer2 = Customer.create(name: 'Bob Anderson', email: 'bob@example.com', password: 'password321', password_confirmation: 'password321')

# Create buses
bus1 = Bus.create(number_of_seats: 50, cost_per_seat: 500, route: 'Nairobi to Mombasa', time_of_travel: Time.now, driver: driver1, registration_number: 'KCA123X')
bus2 = Bus.create(number_of_seats: 40, cost_per_seat: 400, route: 'Nairobi to Kisumu', time_of_travel: Time.now, driver: driver2, registration_number: 'KCB456Y')

# Create bookings
booking1 = Booking.create(seat_number: 10, customer: customer1, bus: bus1)
booking2 = Booking.create(seat_number: 5, customer: customer2, bus: bus2)

puts 'Seed data created successfully!'
