class ConfigurationsController < ApplicationController
  def new
    @configuration = Configuration.first || Configuration.new
  end
  
  def create
    @configuration = Configuration.first || Configuration.new
    @configuration.attributes = params[:configuration]
    
    if @configuration.save
      redirect_to root_url, :notice => "#{Configuration.model_name.human.humanize} guardada"
    else
      render :new
    end
  end
end
