json.extract! assistant, :id, :fname, :email,:course_id,:class_number, :created_at, :updated_at
json.url assistant_url(assistant, format: :json)
