class RoundsController < ApplicationController
  def new
    @match = Match.find(params[:match_id], :include => [:team1, :team2])
    @round = @match.rounds.build
  end
  
  def create
    @match = Match.find(params[:match_id])
    @match.rounds.create(params[:round])
    
    if @match.winner
      redirect_to matches_path, :notice => "#{Match.model_name.human.humanize} terminada. El ganador es: #{@match.winner}"
    else
      redirect_to new_match_round_path(@match)
    end
  end
end
