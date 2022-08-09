class Post < ApplicationRecord
    belongs_to :user
    has_many :favorites
    has_many :post_comments
    has_many :post_tags, dependent: :destroy
    has_many :tags, through: :post_tags
    
    #マップ表示のためのspotテーブルとのアソシエーション
    has_one :spot, dependent: :destroy
    accepts_nested_attributes_for :spot
    
    #activestorageで画像保存
    has_one_attached :post_image
end
