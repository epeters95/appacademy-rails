class SessionController < ApplicationController
  

  def create
    @user = User.find_by_username_and_password({
      username: params[:username],
      password: params[:password]
    })
    
    if @user
      sign_in(@user)
    else
      render :json => { :errors => @user.errors.full_messages }
    end
  end
  
  def destroy
    sign_out
  end
end
