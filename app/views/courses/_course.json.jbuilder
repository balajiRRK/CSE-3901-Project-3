json.extract! course, :id, :courseId, :catalog_number, :title, :description, :short_description, :component, :term, :campus, :subject, :catalog_level, :created_at, :updated_at
json.url course_url(course, format: :json)
