class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @teams = policy_scope(Team)
    @users = User.all

    counter = 0
    @each_teams_members = []
    until counter >= @teams.length do
      @each_teams_members[counter] = []
      counter += 1
    end
    
    counter2 = 0
    @teams.each do |team|
      @accepted_members = Invite.accepted.where(team_id: team.id)
      @team_leader = User.where(team_id: team.id)
      @accepted_members.each do |invite|
        @user = invite.user
        @each_teams_members[counter2] << @user
      end   
      @each_teams_members[counter2] << @team_leader[0]
      counter2 += 1
    end   

    @monday_s = []
    @monday_e = []
    @tuesday_s = []
    @tuesday_e = []
    @wednesday_s = []
    @wednesday_e = []
    @thursday_s = []
    @thursday_e = []
    @friday_s = []
    @friday_e = []
    @saturday_s = []
    @saturday_e = []
    @sunday_s = []
    @sunday_e = []
    
    counter3 = 0
    until counter3 >= @each_teams_members.length
      @monday_s[counter3] = []
      @monday_e[counter3] = []
      @tuesday_s[counter3] = []
      @tuesday_e[counter3] = []
      @wednesday_s[counter3] = []
      @wednesday_e[counter3] = []
      @thursday_s[counter3] = []
      @thursday_e[counter3] = []
      @friday_s[counter3] = []
      @friday_e[counter3] = []
      @saturday_s[counter3] = []
      @saturday_e[counter3] = []
      @sunday_s[counter3] = []
      @sunday_e[counter3] = []

      @each_teams_members[counter3].each do |member|
        @monday_s[counter3] << member.monday_start
        @monday_e[counter3] << member.monday_end
        @tuesday_s[counter3] << member.tuesday_start
        @tuesday_e[counter3] << member.tuesday_end
        @wednesday_s[counter3] << member.wednesday_start
        @wednesday_e[counter3] << member.wednesday_end
        @thursday_s[counter3] << member.thursday_start
        @thursday_e[counter3] << member.thursday_end
        @friday_s[counter3] << member.friday_start
        @friday_e[counter3] << member.friday_end
        @saturday_s[counter3] << member.saturday_start
        @saturday_e[counter3] << member.saturday_end
        @sunday_s[counter3] << member.sunday_start
        @sunday_e[counter3] << member.sunday_end
      end
      counter3 += 1
    end
    raise

# NEED TO SPLIT MEMBERS INTO SEPARATE ELEMENTS
  end

  def show
    @team = Team.find(params[:id])
    @user = User.where(team_id: @team.id)
    @event = Event.new
    @invite = Invite.new
    @accepted_member = Invite.accepted.where(team_id: @team.id)
    @pending_member = Invite.pending.where(team_id: @team.id)
    @declined_member = Invite.declined.where(team_id: @team.id)
    # @unassigned_member = Invite.unassigned.where(team_id: @team.id)
    @applicant = current_user
    authorize @team
  end

  def new
    @team = Team.new
    authorize @team
  end

  def create
    team_params[:game_id] == "" ? team_params[:game_id] = nil :

    @game = Game.find(team_params[:game_id])
    @team = Team.new(
      game: @game,
      user: current_user,
      name: team_params[:name],
      status: team_params[:status],
      discord: team_params[:discord],
      bio: team_params[:bio],
      avatar: team_params[:avatar]
    )
    authorize @team

    if @team.save
      redirect_to teams_path, notice: "Team successfully created"
    else
      render :new, notice: "Please fill in the necessary information"
    end
  end

  private

  def team_params
    params.require(:team).permit(:game_id, :name, :status, :discord, :bio, :avatar)
  end
end
