json.array!(@editors) do |editor|
  json.extract! editor, :id, :name, :email, :is_admin
  json.url editor_url(editor, format: :json)
end
