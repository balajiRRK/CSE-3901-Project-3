class AdminController < ApplicationController
    before_action :authenticate_status!
    before_action :authenticate_admin!
    
    def index
        # @courses = Course.all
        @pagy, @courses = pagy(Course.all)
        @pagy, @users = pagy(User.all)
      end
      
end
