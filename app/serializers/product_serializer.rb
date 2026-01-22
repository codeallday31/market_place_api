class ProductSerializer
  include JSONAPI::Serializer
  attributes :title, :price, :published, :quantity
  belongs_to :user
end
