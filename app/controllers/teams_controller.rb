class TeamsController < ApplicationController

  def index
    @teams = policy_scope(Team)
  end

end
