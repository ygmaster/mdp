class TestController < ApplicationController

  before_filter :login_required, :except => [:test, :upload]


  def test
    require "matji_file_cache_manager"
    mfcm = MatjiFileCacheManager.new(100000002)
    mfcm.add_follower(10000002) 
    t = mfcm.follower
    render :text => t    
 #   render :text => RAILS_ROOT
  end


  def upload

    require "matji_file_cache_manager"
    mfcm = MatjiFileCacheManager.new(100000002)
    uploaded_file = params[:upload_file]

    unless params[:upload_file].nil?
      mfcm.add_profile_img(uploaded_file)
    end

  end
end
