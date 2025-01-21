![image](app/assets/images/home-page.png)

## Features/Capabilities of the App

This app provides an overview of all the CSE classes offered at OSU and a variety of other features such as grader applications, recommendations, and an admin dashboard to manage the entirety of the website which are described in much more depth below. **Accounts can only be made with an [name].[number]@osu.edu email**. There are 3 different account types: student, instructor, and admin. Account types can be selected upon registering, and student accounts will not need admin approval; *however, instructor and admin accounts will need to be approved by an admin in the admin dashboard*. 

With a student account, the user can press "Courses" on the navigation bar to view courses and their sections and you can also search through the courses using the searchbar via the course title, course number, course level, and/or subject. Additionally, as a student you can press "New Grader Application" on the navigation bar to create a new grader application or you can press "Your Grader Applications" to view previously submitted grader applications to view, edit or delete them. The admin users will be in charge of approving or declining grader applications and which sections to assign the graders to.

![image](app/assets/images/courses.png)

![image](app/assets/images/grader_application.png)

With an instructor account, you can press "Create Recommendation" on the navigation bar to fill out a new recommendation form as an instructor for a student or you can press "Recommendations" to view recommendations that you have already submitted. 

![image](app/assets/images/create_recommendation.png)

With an admin account, you can press "Admin Dashboard" on the navigation bar to use the Admin Dashboard where you can approve/deny/view pending users that are awaiting approval, view or delete approved users in manage users, view/edit/delete courses in course catalog, load new courses, view previously loaded courses, add a single new course, delete all courses, view class sections without an assistant (grader) assigned, add an assistant to a section that's missing one, view all courses that have an assistant assigned, view/edit/delete/lookup the assistant's information for each class section that has an assistant. Admins are also in charge of handling approving/denying grader applications and choosing which section to assign the specific grader to based off their application. 

To load courses, on the Admin Dashboard, open the "Course Manager" drop down button and press "Load Courses". The "Load Courses" page has a guide on the bottom of the page to guide the user on how to properly utilize the feature to fetch courses from the API. Once you have created the API search using your specific parameters, you can press "Download this course search" to add all these courses to the database or press "reload using this course search" to override any existing courses in the database and to replace them with your latest api search. 

![image](app/assets/images/admin_dashboard.png)

### Extra Functionalities

When viewing the course catalog, the user is able to search a course by title, course number, course level, and subject. This feature is an optional feature listed in the assignment that we chose to implement to make it easier for users to find their desired course.

After submitting a recommendation as an instructor, you are also able to view previously submitted recommendations.

***

## How to Install and Run the App using Docker

1. Clone the repo either through HTTPS or SSH
   - Through HTTPS: https://github.com/cse-3901-sharkey/2024-su-Team-3-Lab-3.git
   - Through SSH: git@github.com:cse-3901-sharkey/2024-su-Team-3-Lab-3.git

2. Open Docker Desktop and cd inside the directory of the repo

   Then run these commands:
   ```
   docker build --pull --rm -f "Dockerfile" -t course-catalog:1.0.0 .
   docker run --rm -it -v ${PWD}:/app -w /app course-catalog:1.0.0 bundle exec rails db:migrate
   docker run --rm -it -p 3000:3000 -v ${PWD}:/app -w /app course-catalog:1.0.0 bundle exec rails server -b "0.0.0.0"
   ```

3. Open `localhost:3000` in your browser.
     
***

***FOR ADMINS***

*Login for Admin user:*
   - username: admin.1@osu.edu
   - password: team3pass

***

## How to Use the App Once It's Been Installed and Running

1. Sign in as an Admin user using the account details mentioned above and then load courses using the guide in Admin Dashboard and then sign out.

2. Register as a new user using the "Register" button on the navigation bar and if you are selecting an instructor or admin role, you must await admin approval of your account, until then you will have student permissions only.
   
3. If you have not been approved yet, you can press "Courses" on the navigation bar to view courses and their sections and you can also search through the courses using the searchbar via the course title, course number, course level, and/or subject. Additionally, as a student you can press "New Grader Application" on the navigation bar to create a new grader application or you can press "Your Grader Applications" to view previously submitted grader applications to view, edit or delete them.

4. If you have been approved, if you are an instructor: you can press "Create Recommendation" on the navigation bar to fill out a new recommendation form as an instructor for a student or you can press "Recommendations" to view recommendations that you have already submitted. Or, if you are an admin: you can press "Admin Dashboard" on the navigation bar to use the Admin Dashboard.

## Troubleshooting the App

*Problem: Running `bundle install` gives the error*

*"Bundler::PermissionError: There was an error while trying to create. It is likely that you need to grant executable permissions for all parent directories and write permissions* *for `$HOME/.rbenv/versions/3.2.0/lib..`".*

Solution: Restart your computer. Open your terminal and change into the directory of the project. Run the command `bundle install` and `gem pristine --all`

***

*Problem: Entering localhost:3000 into browser gives "This site can't be reached" error*

Solution: Ensure that the rails server has been started and if not do `bin/rails server` to start the server

***

*Problem: Opening website with localhost:3000 gives this error* 

*"Zeitwerk::NameError expected file /home/user/dir/app/helpers/sections_helper.rb to define constant SectionsHelper, but didn't"*

Solution: Refresh browser page.

***

*Problem: Opening website with localhost:3000 gives this error*

*"ActiveRecord::PendingMigrationError Migrations are pending. To resolve this issue, run: bin/rails db:migrate"*

Solution: run `bin/rails db:migrate`

***

*Problem: Opening website with localhost:3000 gives this error*

*"SQLException: table table_name already exists*

Solution: run `bin/rails destroy model table_name`

***

*Problem: When running `rails server`, receiving error message, "Could not find bootstrap-5.3.3, dartsass-sprockets-3.1.0..."*

Solution: run `bundle install --gemfile /[insert full dir path to the project]/Gemfile` to install missing gems.

**

*Problem: When running `rails server`, receiving error message, "Exiting /dir/...: Could not find table 'users' (ActiveRecord::StatementInvalid)"*

Solution: run `rails db:migrate`.

**

*Problem: When running `bundle install`, receiving error message saying bundle install failed"*

Solution: go to `Gemfile` in Project and delete all lines that contain `%i`.

## Contributions

Shristi --  Worked on the application to become a grader feature with Bikash and improved CSS of log-in page

Ryan -- Worked on the recommendation submission feature with Ivy

Balaji -- Summarized project 3 instructions to remove any redudancies/generalities to make it clear what team's tasks were and assessed bugs from Project 2 that needed to be fixed to GitHub issues, handled clear and constant communication within teammates and also with grader to clarify any doubts on deadlines, specific feature requirements, implementation help, and debugging

Javan -- Worked on the new Admin Dashboard along with fixing previous issues of the Admin Dashboard from project 2, improved CSS by implementing Bootstrap, handled database migrations and all merge conflicts when merging all features to main, helped fix teammates implementation issues

Bikash -- Worked on the application to become a grader feature with Shristi 

Ivy -- Worked on the recommendation submission feature with Ryan

***

## Citations/Sources

Sources to help learn Ruby on Rails:
https://guides.rubyonrails.org/getting_started.html

Sources to help learn how to use ruby gems:
https://www.youtube.com/watch?v=9K5YvsrKBRk

Sources to help create CSS:
https://www.w3schools.com/css/
https://getbootstrap.com/docs/5.3/examples/
