# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin
User.create! :username => "Admin", :firstname => "Jim", :lastname => "Carrey", :email => "admin@admin.com", :password => "qweqwe", :password_confirmation => "qweqwe", :role => 1

User
User.create! :username => "Hoho", :firstname => "Henry", :lastname => "Ho", :email => "henry@ho.com", :password => "qweqwe", :password_confirmation => "qweqwe"

User.create! :username => "Sally123", :firstname => "Sally", :lastname => "Sim", :email => "sally@sim.com", :password => "qweqwe", :password_confirmation => "qweqwe"


# Tag 

Tag.create! :name => "Dialect"

Tag.create! :name => "English"

Tag.create! :name => "Mandarin"

Tag.create! :name => "Malay"

Tag.create! :name => "Tamil"

Tag.create! :name => "Army Lingo"

# Post
Post.create! :word => "Singlish", :description => "Colloquial Singaporean English, better known as Singlish, is an English-based creole language spoken in Singapore. The term Singlish is a blend of Singaporean slang and English and was first recorded in 1973.", :meaning => "Singlish means Singlish lor", :user_id =>"1"
