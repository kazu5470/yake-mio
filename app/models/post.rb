class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites
    has_many :post_comments
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    
    #マップ表示のためのspotテーブルとのアソシエーション
    has_one :spot, dependent: :destroy
    
    has_one_attached :post_image
end
