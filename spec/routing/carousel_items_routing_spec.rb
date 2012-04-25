require "spec_helper"

describe CarouselItemsController do
  describe "routing" do

    it "routes to #index" do
      get("/carousel_items").should route_to("carousel_items#index")
    end

    it "routes to #new" do
      get("/carousel_items/new").should route_to("carousel_items#new")
    end

    it "routes to #show" do
      get("/carousel_items/1").should route_to("carousel_items#show", :id => "1")
    end

    it "routes to #edit" do
      get("/carousel_items/1/edit").should route_to("carousel_items#edit", :id => "1")
    end

    it "routes to #create" do
      post("/carousel_items").should route_to("carousel_items#create")
    end

    it "routes to #update" do
      put("/carousel_items/1").should route_to("carousel_items#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/carousel_items/1").should route_to("carousel_items#destroy", :id => "1")
    end

  end
end
