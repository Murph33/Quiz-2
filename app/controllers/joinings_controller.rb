class JoiningsController < ApplicationController



  def create
    idea = Idea.find params[:idea_id]
    joining = idea.joinings.new
    joining.user_id = current_user.id
    if joining.save
      redirect_to root_path, notice: "You joined this idea"
    else
      redirect_to root_path, alert: "Error"
    end
  end

  def destroy
    idea = Idea.find(params[:idea_id])
    joining = idea.joinings.find_by_user_id(current_user)
    joining.destroy
    redirect_to root_path, notice: "You have left this idea"
  end

end
