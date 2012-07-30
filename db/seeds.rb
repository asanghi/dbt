# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.all.each{|x| x.destroy}
10.times do |n|
  c = Company.create(name: "Company #{n}")
  5.times do |m|
    c.message_templates.create do |mt|
      mt.name = "index"
      mt.prefix = "cars"
      mt.source = "<%= @company.name %> from Source #{(1..10).to_a.sample}"
    end
  end
end