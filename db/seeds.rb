# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Author: Francis Zac dela Cruz
# This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.

# Code History:
# Francis Zac dela Cruz
# 02/23/18
# Sprint 2

# Comments
# 02/23/18
# Group 3
# Recoletas Chapel
#
##

## Creating a Superuser
user = User.new
user.email = 'test@example.com'
user.password = 'password192'
user.password_confirmation = 'password192'
user.save!

## Creating the book records
book_list = [
  {section: "Arts and Crafts", title: "Brilliant Art", author: "Garry Walton", batch: 0, size: "Small", callnr: 1},
  {section: "Arts and Crafts", title: "Fantastic Crafts", author: "Paragon", batch: 0, size: "Small", callnr: 2},
  {section: "Bible Stories", title: "838 Ways to Amuse a Child", author: "June Johnson", batch: 0, size: "Small", callnr: 3},
  {section: "Bible Stories", title: "Balloon Animals", author: "Barb Whiter", batch: 0, size: "Small", callnr: 4},
  {section: "Arts and Crafts", title: "A trip to the Farm", author: "Zapp", batch: 0, size: "Medium", callnr: 1},
  {section: "Arts and Crafts", title: "Here comes the Circus", author: "Zapp", batch: 0, size: "Medium", callnr: 2},
  {section: "Arts and Crafts", title: "The Parents Party Book", author: "Sally Lee, Eleanor Levie", batch: 0, size: "Medium", callnr: 3},
  {section: "Bible Stories", title: "Let's Pretend", author: "Pamela Mainprize, Moira Howes", batch: 0, size: "Medium", callnr: 4},
  {section: "Bible Stories", title: "Parties for Kids", author: "Michaeline Bresnahan, Joan Macfarlane", batch: 0, size: "Large", callnr: 1},
  {section: "Arts and Crafts", title: "Vikas Fun With Craft", author: "Subodh Narvekar", batch: 0, size: "Large", callnr: 2}
]

book_list.each do |b|
  Book.create(b)
end
