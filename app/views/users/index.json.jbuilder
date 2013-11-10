json.array!(@users) do |user|
  json.extract! user, :first_name, :last_name, :username, :about_user, :email, :created_at, :updated_at
  json.url user_url(user, format: :json)
end