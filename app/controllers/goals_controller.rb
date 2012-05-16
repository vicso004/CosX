class GoalsController < ApplicationController
  # GET /goals
  # GET /goals.json
  def index
    #@goals = Goal.where(:match_id => params[:match_id])
    @goals =Match.find(params[:match_id]).goals
    authorize! :read, :goals 
    respond_to do |format|
      format.html # index.html.erb
      
    end
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal = Goal.find(params[:id])
    authorize! :read, :goals 
    respond_to do |format|
      format.html # show.html.erb
      
    end
  end

  # GET /goals/new
  # GET /goals/new.json
  def new
    @goal = Goal.new
#    @goal.match_id = params[:match_id]
    @match = Match.find(params[:match_id])
    @players = @match.players
    
    authorize! :manage, :goals 

    respond_to do |format|
      format.html # new.html.erb
     
    end
  end

  # GET /goals/1/edit
  def edit
    @goal = Goal.find(params[:id])
    authorize! :manage, :goals 
    #@match = Match.find(params[:match_id])
    #@players = @match.players
  end

  # POST /goals
  # POST /goals.json
  def create
    
#    @match = Match.find(params[:match_id])
#    @players = @match.players
    @goal = Goal.new(params[:goal])
    @goal.match = Match.find(params[:match_id])
    authorize! :manage, :goals
    respond_to do |format|
      if @goal.save
        format.html { redirect_to matches_path, notice: 'Goal was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /goals/1
  # PUT /goals/1.json
  def update
    @goal = Goal.find(params[:id])
    @match = Match.find(params[:match_id])
    @players = @match.players
    
    authorize! :manage, :goals
    
    respond_to do |format|
      if @goal.update_attributes(params[:goal])
        format.html { redirect_to matches_path, notice: 'Goal was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal = Goal.find(params[:id])
    authorize! :manage, :goals 
    @goal.destroy
    

    respond_to do |format|
      format.html { redirect_to goals_url }
    end
  end
end
