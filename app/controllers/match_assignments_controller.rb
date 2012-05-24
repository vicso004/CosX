# -*- coding: utf-8 -*-
class MatchAssignmentsController < ApplicationController
  
  # Initierar rättighetskontroll 
  authorize_resource
  
  # GET /match_assignments
  # GET /match_assignments.json
  def index
    #Visa endast de kommande matcherna
    @matches = Match.where("datum >= ?",Date.today).order(:datum)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_assignments }
    end
  end

  #Metod för att bekräfta att spelaren kommer på match
  #Spelare skickas vidare till startsidan medan admin kommer till index
  def confirm
    @match_assignment = MatchAssignment.find(params[:id])
    @match_assignment.confirmed = true
    respond_to do |format|
      if @match_assignment.save
        if current_user && current_user.admin == "t"
          format.html {redirect_to match_assignments_path, notice: "Spelaren tackade ja"}
        else
          format.html {redirect_to root_path, notice: "Ses på matchen"}
        end
      else
        format.html {redirect_to root_path, error: "Något gick fel"}
      end
    end
  end
  
  #Metod för att medela att spelaren inte kommer på matchen
  #Spelare skickas vidare till startsidan medan admin kommer till index
  def deny
    @match_assignment = MatchAssignment.find(params[:id])
    @match_assignment.confirmed = false
    respond_to do |format|
      if @match_assignment.save
        if current_user && current_user.admin == "t"
          format.html {redirect_to match_assignments_path, notice: "Spelaren tackade nej"}
        else
          format.html {redirect_to root_path, notice: "Noterat..."}
        end
      else
        format.html {redirect_to root_path, error: "Något gick fel"}
      end
    end
  end
end
