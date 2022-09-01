class Tag < ApplicationRecord
    has_many :post_tags, dependent: :destroy
    belongs_to :post
end
