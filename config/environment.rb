# Load the Rails application.
require_relative "application"

# Initialize the Rails application.
Rails.application.initialize!

# # Adding the admin account automatically after the application is initialized
#      admin = User.create(:email => "admin@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "admin", status: :allowed)
#      admin.save
     

