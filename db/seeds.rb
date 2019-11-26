roles = ['teacher', 'ta', 'student']
10.times do
  course = Course.create( 
    name: Faker::Food.sushi
  )
  5.times do
    user = User.create(
      first_name: Faker::FunnyName.name,
      last_name: Faker::Dessert.topping
    )
    Enrollment.create(
      role: roles.sample,
      course_id: course.id,
      user_id: user.id
    )
  end
end
puts 'Data is seeded'