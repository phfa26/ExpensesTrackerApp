class SessionController < ApplicationController
  def new
    @error_message = flash[:error] # if there is an error, we can now display it in the form
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    user = User.find_by :email => params[:email] # find the user in the DB by the email provided (note :email maps to the email in the form input)
    if user.present? && user.authenticate(params[:password]) # if user exists check if credentials match
      # user exists, store their id in the session hash and redirect them to the root path
      session[:user_id] = user.id
      redirect_to user_path
    else
      # If the user cannot be authenticated, redirect them to the /login screen again.
      flash[:error] = 'Invalid credentials' # add a flash message to later be used by the view
      redirect_to '/login'
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
end
