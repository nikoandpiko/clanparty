class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @teams = policy_scope(Team)
  end

end
