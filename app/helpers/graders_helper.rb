module GradersHelper
  def format_time(time)
    if time.is_a?(Time)
      time.strftime('%I:%M %p')
    elsif time.present?
      Time.parse(time).strftime('%I:%M %p')
    else
      'Not set'
    end
  rescue ArgumentError
    'Invalid time'
  end
end
