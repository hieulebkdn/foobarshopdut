class RecentProducts < CookieCollection
  RECENT_PRODUCT_SIZE = 10

  def initialize cookies
    super cookies
    self.ids = ids.last RECENT_PRODUCT_SIZE
    ids.each do |product_id| 
      product = Product.find_by_id(product_id)
      if product
        push product
      end
    end
  end

  def push product
    delete product
    while length > RECENT_PRODUCT_SIZE - 1
      delete_at 0
    end
    super product
  end
end