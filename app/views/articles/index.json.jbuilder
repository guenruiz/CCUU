json.array!(@articles) do |article|
  json.extract! article, :title, :body, :created_at, :updated_at, :user_id, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at
  json.url article_url(article, format: :json)
end