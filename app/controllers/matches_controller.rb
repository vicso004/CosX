class MatchesController < ApplicationController
  # Initierar rättighetskontroll 
  authorize_resource
  
  # GET /matches
  # GET /matches.json
  def index
    @matches = Match.order(:datum)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matches }
    end
  end

  # GET /matches/1
  # GET /matches/1.json
  def show
    @match = Match.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/new
  # GET /matches/new.json
  def new
    @match = Match.new
    @seasons = Season.all
    #endast aktiva spelare kan tilldelas
    @players = Player.order(:name).where(:active => true)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match }
    end
  end

  # GET /matches/1/edit
  def edit
    @match = Match.find(params[:id])
    @seasons = Season.all    
    #endast aktiva spelare kan tilldelas
    @players = Player.order(:name).where(:active => true)
  end

  # POST /matches
  # POST /matches.json
  def create
    @match = Match.new(params[:match])

    respond_to do |format|
      if @match.save
        format.html { redirect_to matches_path, notice: 'Match skapades' }
        format.json { render json: @match, status: :created, location: @match }
      else
        format.html { render action: "new" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matches/1
  # PUT /matches/1.json
  def update
    @match = Match.find(params[:id])
    respond_to do |format|
      if @match.update_attributes(params[:match])
        format.html { redirect_to matches_path, notice: 'Match uppdaterades' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matches/1
  # DELETE /matches/1.json
  def destroy
    @match = Match.find(params[:id])
    @match.destroy

    respond_to do |format|
      format.html { redirect_to matches_url, notice: "Matchen togs bort"}
      format.json { head :ok }
    end
  end
  
  #Metod för att skicka mail till en matchs uttagna spelare (som det finns mailadress till)
  def send_mail
    
    @match = Match.find(params[:id])
    @match.players.each do |player|
      assignment = MatchAssignment.where(:player_id => player.id, :match_id => @match.id).first
      MatchMailer.assignment_notification(assignment).deliver unless assignment.player.user == nil
    end  
    respond_to do |format|
      format.html { redirect_to matches_url, :notice => "Mail har skickats" }      
    end
    
  end
end
