class GradersController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_status!, only: [:index]
  before_action :set_grader, only: [:show, :edit, :update]
  before_action :set_courses, only: [:new, :edit, :create, :update]

  def new
    @grader = Grader.new
    # Initialize empty availability for all days
    @grader.availability = Grader::DAYS_OF_WEEK.each_with_object({}) { |day, hash| hash[day] = ["", ""] }
  end
  
  def create
    @grader = Grader.new(grader_params)
    process_availability
    # Debug output to check availability after processing
    puts "Availability after processing: #{@grader.availability.inspect}"
    if @grader.save
      # Debug output to check availability after save
      puts "Availability after save: #{@grader.reload.availability.inspect}"
      redirect_to @grader, notice: "Grader application was successfully submitted."
    else
      set_courses
      render :new
    end
  end

  def show
    @grader = Grader.find(params[:id])
  end

  def index
    @graders = Grader.all
  end

  def edit
    @grader = Grader.find(params[:id])
  end

  def destroy
    set_grader
    @grader.destroy! # this line deletes course from database

    respond_to do |format|
      format.html { redirect_to user_applications_path(current_user), notice: "Application was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  def update
    process_availability
    # Debug output to check availability after processing
    puts "Availability after processing: #{@grader.availability.inspect}"
    if @grader.update(grader_params)
      # Debug output to check availability after update
      puts "Availability after update: #{@grader.reload.availability.inspect}"
      redirect_to @grader, notice: "Grader application was successfully updated."
    else
      set_courses
      render :edit
    end
  end

  private

  def set_grader
    @grader = Grader.find(params[:id])
  end

  def set_courses
    @courses = Course.all
  end

  def grader_params
    params.require(:grader).permit(
      :name, :email, :phone_number,
      :monday_start, :monday_end,
      :tuesday_start, :tuesday_end,
      :wednesday_start, :wednesday_end,
      :thursday_start, :thursday_end,
      :friday_start, :friday_end,
      :saturday_start, :saturday_end,
      :sunday_start, :sunday_end,
      :courses_wish_and_qualify_to_grade,:verdict
    )
  end
end

def process_availability
  Grader::DAYS_OF_WEEK.each do |day|
    start_param = params[:grader]["#{day.downcase}_start"]
    end_param = params[:grader]["#{day.downcase}_end"]

    @grader.send("#{day.downcase}_start=", start_param.presence)
    @grader.send("#{day.downcase}_end=", end_param.presence)
  end
end
