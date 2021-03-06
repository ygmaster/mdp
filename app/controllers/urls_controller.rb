class UrlsController < ApplicationController
  before_filter :http_get, :only => [:store_url_list, :user_url_list]
  respond_to :xml, :json
  

  def store_url_list
    if parameters_required :store_id
      conditions = {:store_id => params[:store_id]}
      ret = __find(AttachedUrl, conditions)
      __respond_with ret
    end
  end

  def user_url_list
    if parameters_required :user_id
      conditions = {:user_id => params[:user_id]}
      ret = __find(AttachedUrl, conditions)
      __respond_with ret
    end
  end
  
end
