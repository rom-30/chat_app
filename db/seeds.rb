puts 'Cleaning database...'
Message.destroy_all
User.destroy_all

puts 'Creating Users...'

users_attributes = [
  {
    username: 'romeo',
    password: '123456'
  },
  {
    username: 'jade',
    password: '123456'
  },
  {
    username: 'barney',
    password: '123456'
  }
]

User.create!(users_attributes)
puts "#{User.count} users created"
