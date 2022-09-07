class Api::OrderDetailSerializer < ActiveModel::Serializer
  attributes :id, :order, :product, :qty, :price
end
