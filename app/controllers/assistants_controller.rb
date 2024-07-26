class AssistantsController < ApplicationController
  before_action :set_grader, only: %i[ show edit update destroy ]

  # GET /assistants or /assistants.json
  def index
    @assistants = Assistant.all
  end

  # GET /assistants/1 or /assistants/1.json
  def show
  end

  # GET /assistants/new
  def new
    @assistant = Assistant.new
  end

  # GET /assistants/1/edit
  def edit
  end

  # POST /assistants or /assistants.json
  def create
    @assistant = Assistant.new(grader_params)

    respond_to do |format|
      if @assistant.save
        format.html { redirect_to grader_url(@assistant), notice: "Assistant was successfully created." }
        format.json { render :show, status: :created, location: @assistant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assistants/1 or /assistants/1.json
  def update
    respond_to do |format|
      if @assistant.update(grader_params)
        format.html { redirect_to grader_url(@assistant), notice: "Assistant was successfully updated." }
        format.json { render :show, status: :ok, location: @assistant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @assistant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assistants/1 or /assistants/1.json
  def destroy
    @assistant.destroy!

    respond_to do |format|
      format.html { redirect_to graders_url, notice: "Assistant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_grader
      @assistant = Assistant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def grader_params
      params.require(:grader).permit(:lname, :fname, :email)
    end
end
