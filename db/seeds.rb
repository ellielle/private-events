=begin
User.create!(username: "Butts")
User.create!(username: "Gatling")

10.times do |n|
  title = "event #{n}",
  body = Faker::Lorem.sentence
  date = Time.now + (rand * 3)
  location = "here #{n}"
  creator_id = 1
  Event.create!(title: title,
                body: body,
                date: date,
                location: location,
                creator_id: creator_id)
end

10.times do |n|
  User.first.attendances.create(attendee_id: 1, attended_event_id: n)
end
=end