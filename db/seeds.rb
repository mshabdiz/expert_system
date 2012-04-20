# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'SETTING UP DEFAULT USER'
user = User.create! name: 'First User', email: 'user@example.com', password: 'please', password_confirmation: 'please'
puts 'New user created: ' << user.name

puts 'SETTING UP DEFAULT EXPERT SYSTEM'
expert_system_params = {"name"=>"Employee management", "standards_attributes"=>{"0"=>{"name"=>"Bad", "diagnostic_variables_attributes"=>{"0"=>{"value"=>"0", "beef"=>"0"}, "1"=>{"value"=>"0", "beef"=>"0"}, "2"=>{"value"=>"0", "beef"=>"0"}, "3"=>{"value"=>"0", "beef"=>"0"}, "4"=>{"value"=>"0", "beef"=>"0"}, "5"=>{"value"=>"0", "beef"=>"1"}, "6"=>{"value"=>"0", "beef"=>"1"}}, "directive_attributes"=>{"name"=>"Fire"}}, "1"=>{"name"=>"Not bad", "diagnostic_variables_attributes"=>{"0"=>{"value"=>"0.3333333333333333", "beef"=>"0"}, "1"=>{"value"=>"0.3333333333333333", "beef"=>"0"}, "2"=>{"value"=>"0.3333333333333333", "beef"=>"0"}, "3"=>{"value"=>"0.3333333333333333", "beef"=>"0"}, "4"=>{"value"=>"0.3333333333333333", "beef"=>"0"}, "5"=>{"value"=>"0.3333333333333333", "beef"=>"1"}, "6"=>{"value"=>"0.3333333333333333", "beef"=>"1"}}, "directive_attributes"=>{"name"=>"Do nothing"}}, "2"=>{"name"=>"Well enough", "diagnostic_variables_attributes"=>{"0"=>{"value"=>"0.6666666666666666", "beef"=>"0"}, "1"=>{"value"=>"0.6666666666666666", "beef"=>"0"}, "2"=>{"value"=>"0.6666666666666666", "beef"=>"0"}, "3"=>{"value"=>"0.6666666666666666", "beef"=>"0"}, "4"=>{"value"=>"0.6666666666666666", "beef"=>"0"}, "5"=>{"value"=>"0.6666666666666666", "beef"=>"1"}, "6"=>{"value"=>"0.6666666666666666", "beef"=>"1"}}, "directive_attributes"=>{"name"=>"Increase salary"}}, "3"=>{"name"=>"Pretty well", "diagnostic_variables_attributes"=>{"0"=>{"value"=>"1", "beef"=>"0"}, "1"=>{"value"=>"1", "beef"=>"0"}, "2"=>{"value"=>"1", "beef"=>"0"}, "3"=>{"value"=>"1", "beef"=>"0"}, "4"=>{"value"=>"1", "beef"=>"0"}, "5"=>{"value"=>"1", "beef"=>"1"}, "6"=>{"value"=>"1", "beef"=>"1"}}, "directive_attributes"=>{"name"=>"Designate a managerial position"}}}}
expert_system = User.first.expert_systems.build(expert_system_params)
expert_system.save!
puts 'New expert system created: ' << expert_system.name