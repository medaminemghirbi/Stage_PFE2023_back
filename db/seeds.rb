# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
puts "seeding"
User.create( email: "superadmin@example.com", firstname: "superadmin", lastname:"", password:"123456", password_confirmation:"123456", role:4, email_confirmed: true)
puts "seeding done"