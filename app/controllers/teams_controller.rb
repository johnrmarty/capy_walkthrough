class TeamsController < ApplicationController

  def show
    @team = Team.find(params[:id])
    @players = @team.players
  end

  def index
    @teams = Team.all
  end
end
