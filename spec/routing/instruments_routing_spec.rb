require "spec_helper"

describe InstrumentsController do
  describe "routing" do

    it "routes to #index" do
      get("/instruments").should route_to("instruments#index")
    end

    it "routes to #new" do
      get("/instruments/new").should route_to("instruments#new")
    end

    it "routes to #show" do
      get("/instruments/1").should route_to("instruments#show", :id => "1")
    end

    it "routes to #edit" do
      get("/instruments/1/edit").should route_to("instruments#edit", :id => "1")
    end

    it "routes to #create" do
      post("/instruments").should route_to("instruments#create")
    end

    it "routes to #update" do
      put("/instruments/1").should route_to("instruments#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/instruments/1").should route_to("instruments#destroy", :id => "1")
    end

  end
end
