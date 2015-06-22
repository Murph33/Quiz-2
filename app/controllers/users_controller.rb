class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index

  end

  def create
    user_params = params.require(:user).permit(:first_name, :last_name, :email,
                              :password, :password_confirmation, :current_password)
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thanks for signing up!"
    else
      render :new, alert: "Something went wrong!"
    end
  end

  def edit
    @user = current_user
  end

  def update
    user_params = params.require(:user).permit(:first_name, :last_name, :email,
                              :password, :password_confirmation)
    @user = current_user
    if !@user.authenticate(params[:user][:current_password])
      render :edit, alert: "Incorrect password!"
    elsif @user.update(user_params)
      redirect_to edit_user_path, notice: "Profile updated!"
    else
      render :edit, alert: "Something went wrong!"
    end
  end

  def destroy

  end

  def show
    @user = current_user

  end

end
