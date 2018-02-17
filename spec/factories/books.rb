FactoryGirl.define do
  factory :book do
    title   { Faker::Educator.course }
    author  { Faker::Lorem.word }
    section { Book::SECTIONS[rand(Book::SECTIONS.size)] }
    batch   { rand(10) }
    size    { rand(2) }

    trait :discont do
      status  { :discont }
    end

    trait :on_circ do
      status  { :on_circ }
    end
  end
end

## LICENSE
## This is a course requirement for CS 192 Software Engineering II under the supervision of Asst. Prof. Ma. Rowena C. Solamo of the Department of Computer Science, College of Engineering, University of the Philippines, Diliman for the AY 2017-2018.
##
