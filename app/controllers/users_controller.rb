class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    
    @invite = Invite.where(user_id: @user)
    if !@invite[0].nil?
      @team = Team.where(id: @invite[0].team_id)
    else
      @team = Team.where(id: @user.team_id)
    end
    if !@user.team_id.nil?
      @accepted_member = Invite.accepted.where(team: @team)
    end
    @events = Event.where(team_id: @team)
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
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def edit_schedule
    @user = User.find(params[:id])
    if !@user.team_id.nil?
      @team = Team.where(id: @user.team_id)
      @accepted_member = Invite.accepted.where(team: @team)
    end
     @events = Event.where(team_id: @team)
    authorize @user
  end

  def update_schedule
     @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :bio, :discord, :role, :monday_start, :monday_end, :tuesday_start, :tuesday_end, :wednesday_start, :wednesday_end, :thursday_start,
    :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end)
  end

end
