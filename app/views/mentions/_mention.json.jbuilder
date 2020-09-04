json.extract! mention, :id, :mentioned_id, :mentioned_type, :mentioner_id, :mentioner_type :created_at, :updated_at
json.to_text mention.to_text
json.url mention_url(mention, format: :json)
