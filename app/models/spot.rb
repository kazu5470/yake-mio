class Spot < ApplicationRecord
    #マップ機能のためのpostテーブルとのアソシエーション
    # belongs_to :post

    geocoded_by :address
    after_validation :geocode
end
