# -*- coding: utf-8 -*-
class MatchAssignmentsController < ApplicationController
  
  authorize_resource
  
  # GET /match_assignments
  # GET /match_assignments.json
  def index
    #@match_assignments = MatchAssignment.order(:match_id)
    @matches = Match.where("datum >= ?",Date.today).order(:datum)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @match_assignments }
    end
  end

  
  def confirm
    @match_assignment = MatchAssignment.find(params[:id])
    @match_assignment.confirmed = true
    respond_to do |format|
      if @match_assignment.save
        format.html {redirect_to root_path, notice: "Ses på matchen"}
      else
        format.html {redirect_to root_path, error: "Något gick fel"}
      end
    end
  end
  
  def deny
    @match_assignment = MatchAssignment.find(params[:id])
    @match_assignment.confirmed = false
    respond_to do |format|
      if @match_assignment.save
        format.html {redirect_to root_path, notice: "Noterat..."}
      else
        format.html {redirect_to root_path, error: "Något gick fel"}
      end
    end
  end
end
