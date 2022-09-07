class UserProfileSerializer < ActiveModel::Serializer
  attributes :id, :name, :first_name, :last_name,:gender, :birth_date, :address, :age

  def name
        object.full_name
  end

end