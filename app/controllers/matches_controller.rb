# encoding: UTF-8

class MatchesController < ApplicationController
  before_filter :fetch_teams, :only => [:new, :edit]
  
  def index
    @matches = Match.includes(:team1, :team2, :rounds).sorted
  end
  
  def new
    @match = Match.new
  end
  
  def create
    @match = Match.new(params[:match])
    
    if @match.save
      redirect_to(matches_path, :notice => "#{Match.model_name.human.humanize} creada")
    else
      fetch_teams
      render :new
    end
  end
  
  def edit
    @match = Match.find(params[:id])
  end
  
  def update
    @match = Match.find(params[:id])
    
    if @match.update_attributes(params[:match])
      redirect_to(matches_path, :notice => "#{Match.model_name.human.humanize} actualizada")
    else
      fetch_teams
      render :edit
    end
  end
  
  def destroy
    Match.delete(params[:id])
    redirect_to(matches_path, :notice => "#{Match.model_name.human.humanize} eliminada")
  end
  
  def play
    @match = Match.find(params[:id], :include => :rounds)
    
    if @match.winner
      redirect_to matches_path, :alert => "#{Match.model_name.human.humanize} terminada. El ganador es: #{@match.winner}"
    else
      redirect_to new_match_round_path(@match)
    end
  end
  
  private
  
  def fetch_teams
    @teams = Team.sorted
  end
end
