class OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :order, :product, :qty, :price
end
