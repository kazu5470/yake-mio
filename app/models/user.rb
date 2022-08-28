class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :posts, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_one_attached :profile_image
  
  #フォローした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follow_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  
  #一覧画面用
  has_many :followings, through: :relationships, source: :follower
  has_many :followers, through: :reverse_of_relationships, source: :follow
  
  #フォローした時の処理
  def follow(user)
    relationships.create(follow_id: id, follower_id: user.id)
  end
  
  #フォローを外す時
  def unfollow(user)
    relationships.find_by(follower_id: user.id).destroy
  end
  
  #フォローしているかの判定
  def following?(user)
    followings.pluck(:id).include?(user.id)
  end
  
end