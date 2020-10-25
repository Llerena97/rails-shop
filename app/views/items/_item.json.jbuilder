json.extract! item, :id, :brand, :model, :description, :condition, :finish, :title, :price, :created_at, :updated_at
json.url item_url(item, format: :json)
