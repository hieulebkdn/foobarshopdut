json.extract! user, :id, :name,:password, :email, :phone, :city, :address, :gender, :dob, :created_at, :updated_at
json.url user_url(user, format: :json)
