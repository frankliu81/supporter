# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


def random_department
  rand_num = Random.rand(3)
  if rand_num == 0
    return "sales"
  elsif rand_num ==1
    return "marketing"
  elsif rand_num == 2
    return "technical"
  end

  "sales"
end

1000.times do
  r = Request.create  name: Faker::Name.name,
                      email: Faker::Internet.email,
                      department: random_department,
                      message: Faker::Lorem.paragraph
end
