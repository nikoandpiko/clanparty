class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])

    unless current_user.nil?
      @invite_check = Invite.find_by(user_id: current_user.id)

      if !current_user.team_id.nil? && !@invite_check.nil?
        @current_team = Team.find_by(user_id: @user)
        @teamleader = @user
        @team_members_all = Invite.where(team_id: @current_team.id)
        @leader_teammates = @team_members_all.where(status: 1)
      elsif !@user.team_id.nil? && !@invite_check.nil?
        @current_team = Team.find_by(user_id: @user)
        @teamleader = @user
        @team_members_all = Invite.where(team_id: @current_team.id)
        @leader_teammates = @team_members_all.where(status: 1)

      elsif !current_user.team_id.nil? || !@invite_check.nil?
        @current_team = Team.find_by(user_id: @user)
        if @current_team.nil?
          @current_invite = Invite.find_by(user_id: @user)
          @teammates = Invite.where(team_id: @current_invite.team_id)
          @member_teammates = @teammates.where(status: 1)
          @current_team = Team.find(@current_invite.team_id)
          @leader = User.where(team_id: @current_team)
        else
          @teamleader = @user
          @team_members_all = Invite.where(team_id: @current_team.id)
          @leader_teammates = @team_members_all.where(status: 1)
        end
      elsif !current_user.team_id.nil? || !@invite_check.nil?
        @current_invite = Invite.find_by(user_id: @user)
        @teammates = Invite.where(team_id: @current_invite.team_id)
        @member_teammates = @teammates.where(status: 1)
        @current_team = Team.find(@current_invite.team_id)
        @leader = User.where(team_id: @current_team)

      elsif @invite_check.nil? || @invite_check.status == 0 || @invite_check.status == 2 || @invite_check.status == 3



      else
        @current_invite = Invite.find_by(user_id: @user)
        @teammates = Invite.where(team_id: @current_invite.team_id)
        @member_teammates = @teammates.where(status: 1)
        @current_team = Team.find(@current_invite.team_id)
        @leader = User.where(team_id: @current_team)
      end
    end

    @invite = Invite.where(user_id: @user)

    if !@invite[0].nil?
      @team = Team.where(id: @invite[0].team_id)
    elsif !@user.team_id.nil?
      @team = Team.where(id: @user.team_id)
    end
    @accepted_member = Invite.accepted.where(team: @team) unless @user.team_id.nil?
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
    sleep(1.5)
    redirect_to user_path(@user)
  end

  def edit_schedule
    @user = User.find(params[:id])
    unless @user.team_id.nil?
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
                                 :thursday_end, :friday_start, :friday_end, :saturday_start, :saturday_end, :sunday_start, :sunday_end, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday)
  end
end
