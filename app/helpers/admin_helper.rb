module AdminHelper
  def index
    # @courses = Course.all
    @pagy, @courses = pagy(Course.all)
  end
end
