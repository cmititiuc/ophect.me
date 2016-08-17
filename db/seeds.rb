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
  test_users_count.times.each do |i|
    User.new({
      :email => "test#{i}@example.com",
      :password => password,
      :password_confirmation => password
    }).save(:validate => false)
  end
end

{ 'WelcomeContent' => 'h2. WelcomeContent',
  'AboutContent' => 'AboutContent',
  'HeaderLeft' => "h1. HeaderTitle\r\n\r\nh2. HeaderSubtitle",
  'HeaderRight' => "h2. [\"HeaderRight1\":#]\r\n\r\nh2. [\"HeaderRight2\":#]"
}.each { |k, v| Property.create!(key: k, value: v) }
