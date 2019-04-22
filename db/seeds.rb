# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Message.destroy_all
Channel.destroy_all
User.destroy_all

Channel.create %w[general paris react].map { |channel| { name: channel } }

User.create Array.new(7) { |n| { email: "user_#{n}@email.com", password: 'password' } }

50.times do |n|
  Message.create(
    user: User.find(User.pluck(:id).sample),
    channel: Channel.find(Channel.pluck(:id).sample),
    content: "random ass content #{n}"
  )
end
