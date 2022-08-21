class Public::HomesController < ApplicationController
    def top
    end
    
    
    def guest_sign_in
        user = User.find_or_create_by!(email: 'guest@example.com') do |user|
            user.password = SecureRandom.urlsafe_base64
            user.first_name = "ゲスト"
            user.last_name = "ユーザー"
            user.id = 100
        end 
        sign_in user
        redirect_to public_posts_path
    end    
end
