class SpotsController < ApplicationController
  
  def new
    @post = Review.new
    @post.build_spot
  end

  def create
    @review = Review.new(review_params)
    if @post.save
      redirect_to root_path
    else
      redirect_to new_review_path
    end
  end  

  def show
    @post = Review.find(params[:id])
    @lat = @review.spot.latitude
    @lng = @review.spot.longitude
    gon.lat = @lat
    gon.lng = @lng
  end
  
  private
  
  def review_params
    params.require(:post).permit(:title, :body, spot_attributes: [:address])
  end
  
end
