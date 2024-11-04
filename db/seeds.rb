admin_user = User.find_or_create_by(
  email: 'admin1234@gmail.com',
  username: 'admin1234')
admin_user.password = 'qwer4321`'
admin_user.role = :admin
admin_user.save

puts "Seeded admin user: #{admin_user.username}"

40.times do
  user = User.create(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    middle_name: Faker::Name.middle_name,
    last_name: Faker::Name.last_name,
    username: Faker::Internet.username,
    password: 'password121'
  )
end

puts "Seeded #{User.count} student users."

organizations = [
  { name: 'University of Students Government', code: 'USG' },
  { name: 'Science and Engineering Society', code: 'SES' },
  { name: 'Business Leaders Association', code: 'BLA' },
  { name: 'Environmental Awareness Club', code: 'EAC' },
  { name: 'International Students Association', code: 'ISA' },
  { name: 'Arts and Literature Society', code: 'ALS' },
  { name: 'Sports and Recreation Council', code: 'SRC' },
  { name: 'Technology and Innovation Club', code: 'TIC' },
  { name: 'Community Outreach Program', code: 'COP' },
  { name: 'Debate and Public Speaking Society', code: 'DPSS' },
  { name: 'Health and Wellness Group', code: 'HWG' }
]

organizations.each do |org_attrs|
  Organization.find_or_create_by(org_attrs)
end

puts "Seeded #{Organization.count} organizations."

10.times do
  Member.find_or_create_by(user: User.student.sample, organization: Organization.all.sample, role: :member)
end

puts "Seeded #{Member.count} members."