class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    @roles = ["Tank", "Healer", "DPS"]
    authorize @user
  end

  def update
    @user = User.update(user_params)
    authorize @user

    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :bio, :dicord, :role)
  end

end
