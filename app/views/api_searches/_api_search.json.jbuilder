json.extract! api_search, :id, :search, :term, :campus, :academic_career, :catalog_number, :component, :subject, :instruction_mode, :evening, :created_at, :updated_at
json.url api_search_url(api_search, format: :json)
