json.extract! location, :id, :name, :street_address, :city, :state, :zip, :created_at, :updated_at
json.url location_url(location, format: :json)