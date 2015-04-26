class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      # Store the user's id in the session, to keep track of who's signed in
      session[:user_id] = user.id
      # Redirect to the `root_url` and show a notice that the user has successfully signed in
      redirect_to root_url, notice: 'Successfully signed in!'
    # If the credentials the user gave were bad
    else
      flash.alert = 'Invalid email/password combination. Please try again.'
      # On the view for the `new` action
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully signed out!'
  end
end