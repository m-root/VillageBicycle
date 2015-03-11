Neighborhood.create!(name: "SoHo")
Neighborhood.create!(name: "Greenwich Village")
Neighborhood.create!(name: "East Village")
Neighborhood.create!(name: "Lower East Side")
Neighborhood.create!(name: "West Village")
Neighborhood.create!(name: "TriBeCa")
Neighborhood.create!(name: "Financial District")
Neighborhood.create!(name: "Union Square")
Neighborhood.create!(name: "Chelsea")
Neighborhood.create!(name: "Gramercy")

Size.create!(size: "XS", frame_size: "15\"-16\"", suggested_height:"5'0\"-5'3\"")
Size.create!(size:"S", frame_size: "16\"-17\"", suggested_height: "5'4\"-5'7\"")
Size.create!(size:"M", frame_size: "18\"-19\"", suggested_height: "5'8\"-5'10\"")
Size.create!(size:"L", frame_size: "20\"-21\"", suggested_height: "5'11\"-6'2\"")
Size.create!(size:"XL", frame_size: "22\"-23\"", suggested_height: "6/3\"+")

User.create!(fname:"Seth", lname: "Hamlin", email: "email@example.com",
             password: "password", neighborhood_id: 1, size_id: 1)
