json.extract! charge, :id, :amount, :container_id, :user_id, :comment, :created_at, :updated_at
json.url charge_url(charge, format: :json)