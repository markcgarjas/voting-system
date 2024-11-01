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