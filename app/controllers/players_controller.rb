class PlayersController < ApplicationController

  def new
    @player = Player.new
    @team = Team.find(params[:team_id])
  end

  def create
    team = Team.find(params[:team_id])
    player = Player.new(player_params)
    player.team_id = params[:team_id]

    if player.save
      redirect_to team_path(team)
    else
      render :new
    end
  end

  def index
    team = Team.find(params[:team_id])
    @players = team.players
  end

  def show
    @player = Player.find(params[:id])
    @team = @player.team
  end

  def destroy
    @team = Team.find(params[:team_id])
    @team.destroy
    redirect_to teams_path
  end

  private

  def player_params
    binding.pry
    params.require(:player).permit(:name).merge(team_id: params[:team_id])
  end

end
