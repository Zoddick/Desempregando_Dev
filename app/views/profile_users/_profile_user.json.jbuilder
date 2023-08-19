json.extract! profile_user, :id, :profile_id, :user_id, :created_at, :updated_at
json.url profile_user_url(profile_user, format: :json)
