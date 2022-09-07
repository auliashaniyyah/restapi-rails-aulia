class UserProfile < ApplicationRecord
    extend Enumerize
  
    validates_presence_of :first_name, :gender
    validates_date :birth_date, invalid_date_message: "birth_date must be date format"
    enumerize :gender, in: %i[male female], default: :male
    
    belongs_to :user, optional: true
  
end