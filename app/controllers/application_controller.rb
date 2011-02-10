class ApplicationController < ActionController::Base
  protect_from_forgery


  def authentication_requied
    if params[:access_token]
      # Validate access_token whether exists and not expired
      if AccessGrant.access_token_exists?(params[:access_token])
#         if AccessGrant.access_token_expired?(params[:access_token])
#           return true
#         else
#           @msg = "Access token is expired"
#         end
        return true
      else
        @msg = "The access token is invalid"
      end
    else
      @msg = "Access token parameter is required"
    end
    
    @code = 0
    render :template => 'errors/error'
    return false
  end



  def login_required
    if session[:user]
      return true
    end
    flash[:warning]='Please login to continue'
    session[:return_to]=request.request_uri
    redirect_to '/login'
    return false
  end


  def current_user
    session[:user]
  end


  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to]=nil
      redirect_to(return_to)
    else
      redirect_to :controller=>'users', :action=>'index'
    end
  end



  
end