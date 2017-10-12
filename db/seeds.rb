 @user = User.create(email: "john@doe.com", 
                           password: "123456", 
                           password_confirmation: "123456",
                           first_name: "John",
                           last_name: "Doe")

puts "On user created."

100.times do |post|
  Post.create!(date: Date.today, rationale: "#{post} rationale content", user_id: @user.id)
end

puts "100 posts have been created."

