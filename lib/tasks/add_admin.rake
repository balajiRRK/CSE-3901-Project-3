desc "Creates an admin user and adds him to the database"
task :add_admin => [ :environment ] do
     admin = User.create!(:email => "admin.1@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "admin")
     admin.save
     
end