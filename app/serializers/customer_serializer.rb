class CustomerSerializer < ActiveModel::Serializer
  attributes :id, :name, :address, :phone, :image
end
