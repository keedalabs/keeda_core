json.extract! activity, :id, :verb, :object, :content, :user_id, :parent_activity_id, :created_at, :updated_at
json.url activity_url(activity, format: :json)
