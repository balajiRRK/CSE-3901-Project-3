class SectionsController < ApplicationController
  before_action :set_section, only: %i[ show edit update destroy ]
  before_action :authenticate_admin!, :authenticate_status!, only: %i[ edit update destroy ]
  # this method is getting all the sections from database
  def index
    @sections = Section.all
  end

  # GET /sections/1 or /sections/1.json
  def show
    # set_section is already called before this action due to the before_action callback
  end

  # this method initializes new section and passes the object to the form
  def new
    @section = Section.new
  end

  # GET /sections/1/edit
  def edit
    # set_section is already called before this action due to the before_action callback
    # @section = Section.find_by(params[:id])
  end

  # this method is creating a new section in the database
  def create
    @section = Section.new(section_params)

    respond_to do |format|
      if @section.save # this line saves section in the database
        format.html { redirect_to section_url(@section), notice: "Section was successfully created." }
        format.json { render :show, status: :created, location: @section }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # this method is updating information of existing section
  def update
    # set_section is already called before this action due to the before_action callback
    respond_to do |format|
      if @section.update(section_params) # this line updates section in the database
        format.html { redirect_to section_url(@section), notice: "Section was successfully updated." }
        format.json { render :show, status: :ok, location: @section }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @section.errors, status: :unprocessable_entity }
      end
    end
  end

  # this method deletes section from database
  def destroy
    @section.destroy! # this line deletes section from database

    respond_to do |format|
      format.html { redirect_to sections_url, notice: "Section was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # this method finds the section from the database based on the id parameter
    def set_section
      @section = Section.find(params[:id])
    end

    # this method filters out the params that are related to the section object
    def section_params
      params.require(:section).permit(:courseId, :catalog_number, :class_number, :component, :instruction_mode, :facility_description, :room, :start_time, :end_time, :start_date, :end_date, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :instructor, :term)
    end
end
