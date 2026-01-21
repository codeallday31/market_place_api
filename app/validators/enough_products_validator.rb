class EnoughProductsValidator < ActiveModel::Validator
  def validate(record)
    record.placements.each do |placement|
      product = placement.product
      if product.quantity < placement.quantity
        record.errors.add product.title, "is out of stock, just #{product.quantity} left"
      end
    end
  end
end
