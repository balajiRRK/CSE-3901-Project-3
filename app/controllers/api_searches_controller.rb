class ApiSearchesController < ApplicationController
  before_action :authenticate_admin!, :authenticate_status!, :set_api_search, only: %i[ show edit update destroy ]
  #  check for Net::OpenTimeout
  # GET /api_searches or /api_searches.json
  def index
    @api_searches = ApiSearch.all
  end

  # GET /api_searches/1 or /api_searches/1.json
  def show
    # response = to_response
    # puts response
    # download
   
  end

  # GET /api_searches/new
  def new
    @api_search = ApiSearch.new
  end

  # GET /api_searches/1/edit
  def edit
  end

  
 # straight from our previously made rake task fetch_courses
 # Downloads the courses according to the api parameters
  def fetch_courses response

    puts Rainbow('Adding courses').yellow
    
    
    osu = OsuApiService::OsuAPI.new response
    # the pages variable is needed to know how many pages a search has so that all courses are downloaded from the search
    pages =  osu.fetch_data_info_From_Query['totalPages']
    courses = osu.fetch_From_Query
    
    (1..pages).each do |i|
        
    courses.each do |course_data| 
        # creates a course then save it to the courses table
       course_class = Course.new(title: course_data['course']['title'], courseId: course_data['course']['courseId'],
         description: course_data['course']['description'], catalog_number: course_data['course']['catalogNumber'], 
         component: course_data['course']['component'], term: course_data['course']['term'], campus: course_data['course']['campus'],
         subject: course_data['course']['subject'], catalog_level: course_data['course']['catalogLevel'], short_description: course_data['course']['shortDescription '] )
         
         course_class.save
    end
    # Changes to the next page
    paged_response = response+ "&p="+ i.to_s
    
    
    osu.change_response paged_response
    courses = osu.fetch_From_Query
    end
    puts Rainbow('Course fetch complete!').green
  end

  # Grabs all the sections from specified from the api
def fetch_sections response

    puts Rainbow('Adding sections').yellow
       
    
    osu = OsuApiService::OsuAPI.new response
    pages = osu.fetch_data_info_From_Query['totalPages']
    sections = osu.fetch_From_Query
    
    (1..pages).each do |i|
     
          sections.each do |section_data| 
               course_section = Section.new()
               # Nested loops are used to create a section for each meeting and instructor
               # This will loop for each section under a course
                    section_data['sections'].each do |subsection_data|
                         subsection_data['meetings'].each do |meeting_data|
                                  # The reason I added the sections this way is because I originally thought I needed to add them at different blocks
                                  # Sections will be added at each meeting as instructors/assistants will be
                                  # linked from the instructors or assistants table
                                  
                                   # Adds the sections parts at the subsection level
                                   course_section.course_id = subsection_data['courseId']

                                   course_section.catalog_number = subsection_data['catalogNumber']
                                   course_section.class_number = subsection_data['classNumber']
                                   course_section.component = subsection_data['component']
                                   course_section.term = subsection_data['term']
                                   course_section.section = subsection_data['section']
                                   # Adds the sections parts at the meeting level
                                   course_section.facility_id = meeting_data['facilityId']
                                   course_section.facility_description = meeting_data['facilityDescription']
                                   course_section.room = meeting_data['room']
                                   course_section.start_time = meeting_data['startTime']
                                   course_section.end_time = meeting_data['endTime']
                                   course_section.start_date = meeting_data['startDate']
                                   course_section.end_date = meeting_data['endDate']
                                   course_section.monday = meeting_data['monday']
                                   course_section.tuesday = meeting_data['tuesday']
                                   course_section.wednesday = meeting_data['wednesday']
                                   course_section.thursday = meeting_data['thursday']
                                   course_section.friday = meeting_data['friday']
                                   course_section.saturday = meeting_data['saturday']
                                   course_section.sunday = meeting_data['sunday']
                                   course_section.instruction_mode = subsection_data['instructionMode']
                                   course_section.session = subsection_data['sessionDescription']
                                   
                                   course_section.save
                              meeting_data['instructors'].each do |instructor_data|

                                   

                                   # Adds the section parts at the instructor level
                                   if instructor_data['role'] == 'PI'
                                    instr = Instructor.new()
                                    # full name
                                    instr.fname = instructor_data['displayName']
                                    # instr.role = instructor_data['role']
                                    instr.course_id = subsection_data['courseId']
                                    instr.email = instructor_data['email']
                                    instr.class_number = subsection_data['classNumber']
                                    instr.save
                                   elsif instructor_data['role'] != nil 
                                    grader = Assistant.new()
                                    # full name
                                    grader.fname = instructor_data['displayName']
                                    grader.course_id = subsection_data['courseId']
                                    # grader.role = instructor_data['role']
                                    grader.email = instructor_data['email']
                                    grader.class_number = subsection_data['classNumber']
                                    grader.save
                                   end


                                   
                                    # Still here in case something goes wrong
                                    #  course_section.instructor = instructor_data['displayName']
                                    #  course_section.instructor_role = instructor_data['role']
                                    #  course_section.instructor_email = instructor_data['email']
                                    # course_section.save
                                   
                              end
                         end


                    end

          end
               # Changes the page to the next one
               paged_response = response+ "&p="+ i.to_s
               osu.change_response paged_response
               sections = osu.fetch_From_Query
          end

          puts Rainbow('Sections fetch complete!').green
end
  
  # Converts the keys from the selected api_search to a response that will be in the api format 
  def to_response 
    @api_search = ApiSearch.find(params[:id])
    response = '?q='
    # :search, :term, :campus, :academic_career, :catalog_number, :catalog_level, :component, :subject, :instruction_mode, :evening, :course_id)
    # Single line ifs to make the code easier to read
    # checks if there if there is a value in the key and if not, the format will not be added, but if it is the proper formatting will be included
    @api_search.search.blank? ? response : response = response + @api_search.search
    @api_search.term.blank? ? response : response = response + "&term=" + @api_search.term 
    @api_search.campus.blank? ? response : response = response + "&campus=" + @api_search.campus 
    @api_search.academic_career.blank? ? response : response = response + "&academic-career=" + @api_search.academic_career
    @api_search.catalog_number.blank? ? response : response = response + "&catalog-number=" + @api_search.catalog_number 
    # @api_search.catalog_level.blank? ? response : response = response + "&catalogLevel=" + @api_search.catalog_level 
    @api_search.component.blank? ? response : response = response + "&component=" + @api_search.component 
    @api_search.subject.blank? ? response : response = response + "&subject=" + @api_search.subject 
    @api_search.instruction_mode.blank? ? response : response = response + "&instruction-mode=" + @api_search.instruction_mode
    @api_search.evening.blank? ? response : response = response + "&evening=" + @api_search.evening 
    # @api_search.course_id.nil? ?  response : response = response + "&courseId=" + @api_search.course_id.to_s 
       
  end 

  # POST /api_searches or /api_searches.json
  def create
    @api_search = ApiSearch.new(api_search_params)

    respond_to do |format|
      if @api_search.save
        format.html { redirect_to api_search_url(@api_search), notice: "Api search was successfully created." }
        format.json { render :show, status: :created, location: @api_search }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @api_search.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /api_searches/1 or /api_searches/1.json
  def update
    respond_to do |format|
      if @api_search.update(api_search_params)
        format.html { redirect_to api_search_url(@api_search), notice: "Api search was successfully updated." }
        format.json { render :show, status: :ok, location: @api_search }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @api_search.errors, status: :unprocessable_entity }
      end
    end
  end
# this will erase previous data and replace it with downloaded data instead
  def reload
    wipe
    download
  end
  #erase all table data for courses, sections, assistants, and instructors
  def wipe
    Course.delete_all
    Section.delete_all
    Assistant.delete_all
    Instructor.delete_all
  end
# This will download the courses specified from the selected api_search
  def download 
   ApiSearch.find(params[:id])
    response = to_response
    fetch_courses response
    fetch_sections response
    respond_to do |format|
      format.html { redirect_to api_searches_url, notice: "Data from the api was successfully downloaded." }
      format.json { head :no_content }
    end
  end
  # DELETE /api_searches/1 or /api_searches/1.json
  def destroy
    @api_search.destroy!

    respond_to do |format|
      format.html { redirect_to api_searches_url, notice: "Api search was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_search
      @api_search = ApiSearch.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_search_params
      params.require(:api_search).permit(:search, :term, :campus, :academic_career, :catalog_number, :component, :subject, :instruction_mode, :evening)
    end
end
