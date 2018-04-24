json.extract! admin, :id, :name, :password, :email, :phone, :company, :address, :rating, :created_at, :updated_at
json.url admin_url(admin, format: :json)
