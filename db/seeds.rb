# Create a sample Member
Member.create!(name: "Example Member",
  email: "example@example.com",
  password: "foobar",
  password_confirmation: "foobar")

# Generate other Members
99.times do |n|
Member.create!(name: Faker::Name.name,
    email: "example-#{n+1}@example.com",
    password: "password",
    password_confirmation: "password")
end
