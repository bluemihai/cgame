json.extract! game, :id, :starting, :ending, :location_id, :host_id, :facebook_event_url, :review, :created_at, :updated_at
json.url game_url(game, format: :json)