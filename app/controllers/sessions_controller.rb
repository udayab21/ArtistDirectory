class SessionsController < ApplicationController
    def new; end
  
    def create
      user = User.find_by(email: params[:email])
      if user.present? && user.authenticate(params[:password])
        session[:user_id] = user.id
  
        if logged_in? && admin?
          redirect_to dash_path
  
        else
          redirect_to dashboard_path
        end
      else
        flash[:alert] = 'Invalid email or password'
        flash.discard
        render :new
  
      end
    end
  
    
  
      # Do something with the access token, such as store it in the session or database
      # and redirect the user to a new page.
  
    def destroy
      session[:user_id] = nil
      redirect_to root_path, notice: 'Logged out successfully'
    end
  end