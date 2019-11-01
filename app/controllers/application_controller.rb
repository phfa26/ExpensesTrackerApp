class ApplicationController < ActionController::Base
    
    # Before any action is performed, call the fetch_user method.
    before_action :fetch_user
  
    private
  
    def fetch_user
      # Search for a user by their user id if we can find one in the session hash.
      if session[:user_id].present?
        @current_user = User.find_by :id => session[:user_id]
        # Clear out the session user_id if no user is found.
      end
      session[:user_id] = nil unless @current_user.present?
    end
  
    def check_if_logged_in
      unless @current_user.present?
        flash[:error] = 'You must be logged in to see this page'
        redirect_to login_path
      end
    end
  end