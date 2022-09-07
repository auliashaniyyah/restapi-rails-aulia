class Product < ApplicationRecord
    include PgSearch::Model
    pg_search_scope :search, against: %i[name price],
                    using: {
                    tsearch: {
                        prefix: true
                      }
                     }
    mount_uploader :image, ImageUploader
end
