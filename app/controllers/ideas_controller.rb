class IdeasController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy, :edit]

  def index
    @idea = Idea.new
    @ideas = Idea.all
    @joining = Joining.new
  end

  def new
    @idea = Idea.new
  end

  def create
    idea_params = params.require(:idea).permit(:body, :title)
    @ideas = Idea.all
    @idea = Idea.new idea_params
    @idea.user = current_user
    if @idea.save
      redirect_to user_idea_path(current_user,@idea), notice: "Thanks for the idea!"
    else
      flash[:alert] = "Something went wrong with that one!"
      render :index
    end
  end

  def destroy

  end

  def edit

  end

  def show
    @idea = Idea.find params[:id]
    @comment = Comment.new
  end

  def joining_for(user)
    joinings.find_by_user_id(user)
  end

end
