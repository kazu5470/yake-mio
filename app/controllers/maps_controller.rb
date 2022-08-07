class MapsController < ApplicationController
  
  def index
  end
  
  def map
    results = Geocoder.search(params[:address])
    @latlng = results.first.coordinates
    #respond_to以下の記述によって
    #remote: trueのアクセスに対し
    #map.js.erbが使えるようになる
    respond_to do |format|
      format.js
    end
  end  
end
