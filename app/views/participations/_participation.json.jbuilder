json.extract! participation, :id, :group_id, :user_id, :rating, :comment, :created_at, :updated_at
json.url participation_url(participation, format: :json)