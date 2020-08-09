json.extract! post, :id, :word, :description, :example, :created_at, :updated_at, :meaning
json.url post_url(post, format: :json)
