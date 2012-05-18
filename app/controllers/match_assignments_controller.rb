class MatchAssignmentsController < ApplicationController
  
  authorize_resource
  
  # GET /match_assignments
  # GET /match_assignments.json
  def index
    @match_assignments = MatchAssignment.all
    @players = Player.where(:active => true)
    @matches = Match.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_assignments }
    end
  end

  # GET /match_assignments/1
  # GET /match_assignments/1.json
  def show
    @match_assignment = MatchAssignment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @match_assignment }
    end
  end

  # GET /match_assignments/new
  # GET /match_assignments/new.json
  def new
    @match_assignment = MatchAssignment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @match_assignment }
    end
  end

  # GET /match_assignments/1/edit
  def edit
    @match_assignment = MatchAssignment.find(params[:id])
  end

  # POST /match_assignments
  # POST /match_assignments.json
  def create
    @match_assignment = MatchAssignment.new(params[:match_assignment])

    respond_to do |format|
      if @match_assignment.save
        format.html { redirect_to @match_assignment, notice: 'Lyckades' }
        format.json { render json: @match_assignment, status: :created, location: @match_assignment }
      else
        format.html { render action: "new" }
        format.json { render json: @match_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /match_assignments/1
  # PUT /match_assignments/1.json
  def update
    @match_assignment = MatchAssignment.find(params[:id])

    respond_to do |format|
      if @match_assignment.update_attributes(params[:match_assignment])
        format.html { redirect_to @match_assignment, notice: 'Lyckades' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @match_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /match_assignments/1
  # DELETE /match_assignments/1.json
  def destroy
    @match_assignment = MatchAssignment.find(params[:id])
    @match_assignment.destroy

    respond_to do |format|
      format.html { redirect_to match_assignments_url }
      format.json { head :ok }
    end
  end
  
  def confirm
    @match_assignment = MatchAssignment.find(params[:id])
    @match_assignment.confirmed = true
    respond_to do |format|
      if @match_assignment.save
        format.html {redirect_to root_path, notice: "Ses pa matchen"}
      else
        format.html {redirect_to root_path, error: "Nagot gick snett"}
      end
    end
  end
end
