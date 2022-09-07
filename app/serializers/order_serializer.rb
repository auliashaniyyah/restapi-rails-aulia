class OrderSerializer < ActiveModel::Serializer
  attributes :id, :customer, :date, :total, :status
end
