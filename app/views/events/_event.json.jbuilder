json.extract! event, :id, :name, :location, :scheduled_at, :description, :created_at, :updated_at
json.url event_url(event, format: :json)
