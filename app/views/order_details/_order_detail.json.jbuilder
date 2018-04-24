json.extract! order_detail, :id, :price, :quantity, :status, :userrequest, :shipday, :created_at, :updated_at
json.url order_detail_url(order_detail, format: :json)
