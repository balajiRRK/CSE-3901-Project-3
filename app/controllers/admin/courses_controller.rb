class Admin::CoursesController < ApplicationController
  before_action :authenticate_admin!, :authenticate_status!
  include OsuApiService
  #this will put the data obtained from the api to the database
  def load 
   
  end
  

end
