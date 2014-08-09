class GoalsController < ApplicationController
  
  def create
    user = User.find(params[:user_id])
    goal = user.goals.new(goal_params)
    if goal.save
      redirect_to user_url(user)
    else
      flash[:errors] = goal.errors.full_messages
      redirect_to user_url(user)
    end
  end
  
  def destroy
    goal = Goal.find(params[:id])
    goal.destroy
    redirect_to user_url(goal.user)
  end
  
  def update
    goal = Goal.find(params[:id])
    goal.completed = true
    goal.save!
    redirect_to user_url(goal.user)    
  end
  
  private
  def goal_params
    params.require(:goal).permit(:name)
  end
end