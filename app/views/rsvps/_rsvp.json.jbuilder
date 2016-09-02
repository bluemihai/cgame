json.extract! rsvp, :id, :user_id, :game_id, :attended, :rsvp_method, :created_at, :updated_at
json.url rsvp_url(rsvp, format: :json)