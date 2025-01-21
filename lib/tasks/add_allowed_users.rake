task :add_allowed_users => [ :environment ] do
    (1..10).each do |i|
        User.create!(:email => "student."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "student", status: :allowed).save
        User.create!(:email => "instructor."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "instructor", status: :allowed).save
        User.create!(:email => "admin."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "admin", status: :allowed).save
    end
end
task :add_pending_users => [ :environment ] do
    (1..10).each do |i|
        User.create!(:email => "studentP."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "student", status: :pending).save
        User.create!(:email => "instructorP."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "instructor", status: :pending).save
        User.create!(:email => "adminP."+i.to_s+"@osu.edu", :password => "team3pass", :password_confirmation => "team3pass", role: "admin", status: :pending).save
    end
end
