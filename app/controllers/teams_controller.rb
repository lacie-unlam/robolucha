class TeamsController < ApplicationController
  def index
    @teams = Team.sorted
  end
  
  def new
    @team = Team.new
  end
  
  def create
    @team = Team.new(params[:team])
    
    if @team.save
      redirect_to(teams_path, :notice => "#{Team.model_name.human.humanize} creado")
    else
      render :new
    end
  end
  
  def edit
    @team = Team.find(params[:id])
  end
  
  def update
    @team = Team.find(params[:id])
    
    if @team.update_attributes(params[:team])
      redirect_to(teams_path, :notice => "#{Team.model_name.human.humanize} actualizado")
    else
      render :edit
    end
  end
  
  def destroy
    Team.delete(params[:id])
    redirect_to(teams_path, :notice => "#{Team.model_name.human.humanize} eliminado")
  end
end
