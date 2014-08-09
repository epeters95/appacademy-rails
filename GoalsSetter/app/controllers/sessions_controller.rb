class SessionsController < ApplicationController
  
  def create
    user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )
    if user
      login!(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = "Invalid username or password"
      redirect_to new_user_url
    end
  end
  
  def destroy
    logout! if logged_in?
    redirect_to new_user_url
  end
  
  private
  def session_params
    params.require(:session).permit(:username, :password)
  end
end
