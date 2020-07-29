json.extract! reaction, :id, :type, :user_id, :object, :activity_id, :created_at, :updated_at
json.url reaction_url(reaction, format: :json)
