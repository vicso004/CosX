class MatchesPlayersController < ApplicationController
  
  def new
    @matches = Match.all
    @players = Player.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end
  
  def create
    @relation = Match.new(params[:match])
    @matches = Match.all
    @players = Player.all

    respond_to do |format|
      if @relaton.save
        format.html { redirect_to @relaton, notice: 'lyckades' }
        format.json { render json: @relaton, status: :created, location: @relaton }
      else
        format.html { render action: "new" }
        format.json { render json: @relaton.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url }
      format.json { head :ok }
    end
  end
end
