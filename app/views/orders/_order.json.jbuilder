json.extract! order, :id, :shipname, :shipaddress, :phone, :city, :created_at, :updated_at
json.url order_url(order, format: :json)
