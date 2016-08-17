# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if Rails.env == 'development'
  test_users_count = 2
  password = "test1234"
  test_users_count.times.each do |e|
    User.new({
      :email => "test#{e}@example.com",
      :password => password,
      :password_confirmation => password
    }).save(:validate => false)
  end
end

%w(
  HeaderName
  HeaderEmail
  HeaderGitHubAccountName
  AboutContent
  HeaderSubtitle
  WelcomeContent
).each { |p| Property.create!(key: p, value: nil) }
