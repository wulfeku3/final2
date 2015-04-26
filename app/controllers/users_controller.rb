# app/controllers/users_controller.rb

class UsersController < ApplicationController

  def new
    end

    def create
      user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash.alert = 'Welcome! Thanks for signing up.'
      redirect_to '/'
    else
        flash.alert = 'Could not create new account. Possible errors: passwords did not match or email is taken.'
        redirect_to '/sign-in'
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end