json.extract! haiku, :id, :author_id, :activity_id, :content, :created_at, :updated_at
json.url haiku_url(haiku, format: :json)