class Admin::DashboardController < ApplicationController
  before_action :authenticate_admin!, :authenticate_status!
  include Devise

  def index
    # paginations for the renders
    @pagy_assigned, @has_grader = pagy(Section.where.associated(:assistants).all, page_param: :has_grader)
    @pagy_unassigned, @no_grader = pagy(Section.where.missing(:assistants).all, page_param: :no_grader)
    @pagy_course, @courses = pagy(Course.all, page_param: :course_page)
    @pagy_user, @users = pagy(User.all, page_param: :user_page)
    @pagy_pending, @pending_users = pagy(User.where(status: "pending").where.not(role: "student").all, page_param: :pending_page)
    @pagy_assistant, @assistants = pagy(Assistant.all, page_param: :assistants)
    @pagy_application, @grader = pagy(Grader.where(verdict: :pending).all, page_param: :grader_page)
    @pagy_grader_approved, @grader_approved = pagy(Grader.where(verdict: :allowed).all, page_param: :grader_approved_page)

    @assistant = Assistant.new
  end
end
