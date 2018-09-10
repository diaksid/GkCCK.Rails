# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# YAML.load_file('db/seeds/users.yml').each do |model|
#   User.create! ({confirmed_at: Time.now.utc}).merge model
# end if User.all.empty?

# (1..1000).each do |idx|
#   Target.create! ({name: "Object #{idx}"})
# end

User.create! YAML.load_file 'db/seeds/users.yml' if User.all.empty?

YAML.load_file('db/seeds/areas.yml').each do |model|
  Area.create! ({active: true}).merge model
end if Area.all.empty?

YAML.load_file('db/seeds/activities.yml').each do |model|
  area_ids = model.delete 'area_ids'
  model = Activity.create! ({published: true,
                             navigated: true}).merge model
  model.area_ids = area_ids if area_ids
end if Activity.all.empty?

YAML.load_file('db/seeds/partners.yml').each do |model|
  Partner.create! ({active: true,
                    published: true,
                    navigated: true}).merge model
end if Partner.all.empty?

YAML.load_file('db/seeds/targets.yml').each do |model|
  area_ids = model.delete 'area_ids'
  model = Target.create! ({published: true,
                           navigated: true}).merge model
  model.area_ids = area_ids if area_ids
end if Target.all.empty?

YAML.load_file('db/seeds/permits.yml').each_with_index do |model, idx|
  Permit.create! ({published: true,
                   navigated: true,
                   number: idx.to_s * 7,
                   provider: "?",
                   issue_at: Time.now}).merge model
end if Permit.all.empty?
