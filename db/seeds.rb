# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
accounts = []
i = (Account.last.id) + 1
j = i + 20

while ( i <= j) do
    new_account={
        id: i,
        encrypted_password: "sowndar",
        email: Faker::Internet.email,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Name.username,
        description: Faker::Name.description,
        website: Faker::Name.website
    }
    accounts.push(new_account)
    i = i + 1
end
Account.create(accounts)