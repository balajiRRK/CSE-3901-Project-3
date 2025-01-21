# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
task :add_allowed_users => [ :environment ] do
(1..10).each do |i|
User.create!(:email => "student."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "student", status: :allowed).save
User.create!(:email => "instructor."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "instructor", status: :allowed).save
end
end
