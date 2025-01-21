# The sources used for this file vary, including ChatGPT and Carmen resources:
# https://www.youtube.com/playlist?list=PLlxmoA0rQ-Lx45j3D6da7-Iqvo5wtjKBm
# https://www.youtube.com/playlist?list=PLS1QulWo1RIbNBXZAeVbkkHEj9zsEbXQK
# https://www.railstutorial.org/book
# https://www.youtube.com/watch?v=GY7Ps8fqGdc
# https://chatgpt.com/

module Instructors   #module Instructors
  class RecommendationsController < ApplicationController
    before_action :authenticate_user!     #check user is authenticated
    before_action :authenticate_status!     #check user is authenticated
    # before_action :authenticate_instructor!    #check user is instructor

    def index
      @recommendations = Recommendation.all  #get all recommendations
    end

    def show
      @recommendation = Recommendation.find(params[:id])  #find recommendation by id
    end

    def new
        #@course = Course.find(params[:course_id])   #find course by course id
        @recommendation = Recommendation.new   #new recommendation
    end

    def create
        @recommendation = Recommendation.new(recommendation_params) #create a new recommendation with the params
        @recommendation.instructor = current_user   #set instructor id to current user id


          # They meant catalog_number instead
          if @recommendation.save  #if course id present and course exists
            send_invite_if_student_not_registered(@recommendation.student_email) #send invite if student not registered
            redirect_to instructors_recommendations_path, notice: "Recommendation created successfully" #redirect to admin recommendations path
          else
            flash.now[:alert] = "Please fix errors below: #{@recommendation.errors.full_messages.to_sentence}"  #flash alert
            render :new     #render new
          end



    end

    private

    def recommendation_params   #recommendation params
        params.require(:recommendation).permit(:student_email, :course_id, :recommendation_type, :notes)  #permit instructor_id, student_email, course_id, recommendation_type
    end

    def send_invite_if_student_not_registered(student_email)  #send invite if student not registered
      course = Course.find_by(id: params[:recommendation][:course_id])  #find course by id
      unless User.exists?(email: student_email)  #unless user find by email
        UserMailer.invite_student(student_email, course).deliver_later  #send invite to student
      end
    end

    def authenticate_instructor!  #authenticate instructor
        redirect_to(root_path, alert: "You are not authorized to access this page") unless current_user.instructor?  #redirect to root path
    end
  end
end
