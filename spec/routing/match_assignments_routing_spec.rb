require "spec_helper"

describe MatchAssignmentsController do
  describe "routing" do

    it "routes to #index" do
      get("/match_assignments").should route_to("match_assignments#index")
    end

    it "routes to #new" do
      get("/match_assignments/new").should route_to("match_assignments#new")
    end

    it "routes to #show" do
      get("/match_assignments/1").should route_to("match_assignments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/match_assignments/1/edit").should route_to("match_assignments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/match_assignments").should route_to("match_assignments#create")
    end

    it "routes to #update" do
      put("/match_assignments/1").should route_to("match_assignments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/match_assignments/1").should route_to("match_assignments#destroy", :id => "1")
    end

  end
end
