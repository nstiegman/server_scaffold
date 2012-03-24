require "spec_helper"

describe LightsController do
  describe "routing" do

    it "routes to #index" do
      get("/lights").should route_to("lights#index")
    end

    it "routes to #new" do
      get("/lights/new").should route_to("lights#new")
    end

    it "routes to #show" do
      get("/lights/1").should route_to("lights#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lights/1/edit").should route_to("lights#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lights").should route_to("lights#create")
    end

    it "routes to #update" do
      put("/lights/1").should route_to("lights#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lights/1").should route_to("lights#destroy", :id => "1")
    end

  end
end
