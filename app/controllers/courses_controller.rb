class CoursesController < ApplicationController
  # before_action 
before_action :authenticate_user!
before_action :authenticate_admin!, :authenticate_status!, only: [:destroy, :update, :wipe]
  # this method is getting all the courses from database
  def index
    # @courses = Course.all
    @pagy, @courses = pagy(Course.all)
  end

  # this method will show the details of single course
  def show 
    # puts 'super'
    # puts params[:course]
    # puts params[:courseName]
    
    @course = Course.find(params[:id])
   
  end

  # this method initializes new course and pass the object to form
  def new
    @course = Course.new
  end

  # this method is called when we edit any course
  def edit
    set_course
  end

  # this method searches the courses based on the params passed and then sorts them based on the type of sorting selected by the user
  def index
    if params[:course] && params[:course][:search].present?
      @pagy, @courses = pagy(Course.where("id LIKE ? OR title LIKE ? OR catalog_number LIKE ? OR catalog_level LIKE ? OR subject LIKE ?", 
      "%#{params[:course][:search]}%", 
      "%#{params[:course][:search]}%", 
      "%#{params[:course][:search]}%", 
      "%#{params[:course][:search]}%", 
      "%#{params[:course][:search]}%"))

    # if params[:course] && params[:course][:search].present?
    #   @courses = Course.where("id LIKE ? OR title LIKE ? OR catalog_number LIKE ? OR catalog_level LIKE ? OR subject LIKE ?", 
    #                           "%#{params[:course][:search]}%", 
    #                           "%#{params[:course][:search]}%", 
    #                           "%#{params[:course][:search]}%", 
    #                           "%#{params[:course][:search]}%", 
    #                           "%#{params[:course][:search]}%")
    else
      @pagy, @courses = pagy(Course.all)
      # @courses = Course.all
    end
    @pagy, @courses = pagy(@courses.order(params[:order]) ) if params[:order].present?
    # @courses = @courses.order(params[:order]) if params[:order].present?
  end

  # this method is creating new course in the database
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save # this line saves course in the database
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # this method is updating information of existing courses
  def update
    set_course
    respond_to do |format|
      if @course.update(course_params) # this line updates course in the database
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # This will remove all courses from the course catalog
  def wipe
    Course.delete_all
    Section.delete_all
    Assistant.delete_all
    Instructor.delete_all
  end

  # this method deletes course from database
  def destroy
    set_course
    @course.destroy! # this line deletes course from database

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # this method finds the course from the database based on the id parameter
    def set_course
      @course = Course.find(params[:id])
    end

    # this method filters out the params that are related to the course object
    def course_params
      params.require(:course).permit(:title, :catalog_number, :description, :short_description, :component, :term, :campus, :subject, :courseId)
    end
end
