admin_user = User.find_or_initialize_by(
  email: 'admin1234@gmail.com',
  username: 'admin1234',
  role: :admin)

if admin_user.new_record?
  admin_user.password = 'qwer4321`'
  admin_user.save
end

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
end if User.student.empty?

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


officer_positions = [
  { name: "Student Council President", sort: 1 },
  { name: "Student Council Vice President", sort: 2 },
  { name: "Secretary", sort: 3 },
  { name: "Treasurer", sort: 4 },
  { name: "Auditor", sort: 5 },
  { name: "Public Relations Officer (PRO)", sort: 6 },
  { name: "Sergeant-at-Arms", sort: 7 },
  { name: "Historian", sort: 8 },
  { name: "Assistant Secretary", sort: 9 },
  { name: "Assistant Treasurer", sort: 10 },
  { name: "Committee Chairperson", sort: 11 },
  { name: "Class Representative", sort: 12 },
  { name: "Grade Level Representative", sort: 13 },
  { name: "Sports Coordinator", sort: 14 },
  { name: "Cultural Affairs Officer", sort: 15 },
  { name: "Environmental Officer", sort: 16 },
  { name: "Academic Affairs Officer", sort: 17 },
  { name: "Social Media Manager", sort: 18 },
  { name: "Head of Student Activities", sort: 19 },
  { name: "Club President", sort: 20 },
  { name: "Club Vice President", sort: 21 },
  { name: "Club Secretary", sort: 22 },
  { name: "Club Treasurer", sort: 23 },
  { name: "Club Auditor", sort: 24 },
  { name: "Committee Leader", sort: 25 },
  { name: "Prefect of Discipline", sort: 26 },
  { name: "Chief Editor", sort: 27 },
  { name: "Assistant Editor", sort: 28 },
  { name: "Head of Logistics", sort: 29 },
  { name: "Student Body President", sort: 30 },
  { name: "Student Body Vice President", sort: 31 },
  { name: "Science Club President", sort: 32 },
  { name: "Math Club President", sort: 33 },
  { name: "Sports Captain", sort: 34 },
  { name: "Dance Club President", sort: 35 },
  { name: "Music Club President", sort: 36 },
  { name: "Art Club President", sort: 37 },
  { name: "Debate Club President", sort: 38 },
  { name: "Drama Club President", sort: 39 },
  { name: "School Ambassador", sort: 40 }
]

officer_positions.each do |position|
  OfficerPosition.find_or_create_by(name: position[:name], sort: position[:sort])
end

puts "Seeded #{officer_positions.count} positions created."

10.times do
  Member.find_or_create_by(user: User.student.sample, organization: Organization.all.sample, role: :member, officer_position: OfficerPosition.all.sample)
end

puts "Seeded #{Member.count} members."

10.times do
  Election.find_or_create_by(name: "#{Faker::Educator.subject} Student Council Election", user: User.admin.sample, organization: Organization.all.sample)
end

puts "Seeded #{Election.count} elections."