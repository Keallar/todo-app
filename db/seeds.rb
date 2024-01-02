# frozen_string_literal: true

User.destroy_all

user = User.new(username: 'test', email: 'test@test.ru', password: 'test')
user.save

list = List.create(title: Faker::Book.title, user_id: user)

3.times do
  Item.create(
    description: Faker::Verb.base,
    status: rand(0..2),
    list_id: list.id,
  )
end

