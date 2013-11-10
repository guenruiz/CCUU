json.array!(@sources) do |source|
  json.extract! source, :name, :description, :url,  :route, :created_at, :updated_at, :article_id
  json.url source_url(source, format: :json)
end