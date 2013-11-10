json.array!(@art_objects) do |art_object|
  json.extract! art_object, :name, :description, :route, :created_at, :updated_at, :article_id
  json.url art_object_url(art_object, format: :json)
end