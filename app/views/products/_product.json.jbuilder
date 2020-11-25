json.extract! product, :id, :name, :detail, :created_at, :updated_at
json.url product_url(product, format: :json)
