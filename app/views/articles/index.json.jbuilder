json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :view_count
  json.url article_url(article, format: :json)
end
