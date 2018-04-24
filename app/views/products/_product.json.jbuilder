json.extract! product, :id, :name, :price, :weight, :image, :stock, :detail, :description, :warranty, :rating, :cpu, :ram, :memory, :display, :created_at, :updated_at
json.url product_url(product, format: :json)
