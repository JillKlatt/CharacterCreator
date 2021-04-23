# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# 10.times do 
#     User.create({
#         "email" => Faker::Internet.email,
#         "password" => Faker::Internet.password
#     })
# end

10.times do
    Character.create({
        "name" => Faker::Fantasy::Tolkien.character,
        "age" => Faker::Number.number(digits: 2),
        "description" => Faker::Books::Lovecraft.paragraph(sentence_count: 2)
    })
end

10.times do
    Category.create({
        "name" => Faker::Games::DnD.klass
        "trait" => Faker::Lorem.sentence(word_count: 3)
    })
end

10.times do
    Race.create({
        "name" => Faker::Games::DnD.race
        "trait" => Faker::Lorem.sentence(word_count: 3)
    })
end

10.times do 
    Weapon.create({
        "name" => Faker::Games::DnD.melee_weapon
        "description" => Faker::Books::Lovecraft.words
        "damage" => Faker::Number.number(digits: 2)
    })
end