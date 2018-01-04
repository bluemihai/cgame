json.extract! video, :id, :url, :abstract, :transcript, :minutes, :created_at, :updated_at
json.url video_url(video, format: :json)
