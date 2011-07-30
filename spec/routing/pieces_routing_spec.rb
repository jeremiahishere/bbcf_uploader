require "spec_helper"

describe PiecesController do
  describe "routing" do

    it "routes to #index" do
      get("/pieces").should route_to("pieces#index")
    end

    it "routes to #new" do
      get("/pieces/new").should route_to("pieces#new")
    end

    it "routes to #show" do
      get("/pieces/1").should route_to("pieces#show", :id => "1")
    end

    it "routes to #edit" do
      get("/pieces/1/edit").should route_to("pieces#edit", :id => "1")
    end

    it "routes to #create" do
      post("/pieces").should route_to("pieces#create")
    end

    it "routes to #update" do
      put("/pieces/1").should route_to("pieces#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/pieces/1").should route_to("pieces#destroy", :id => "1")
    end

  end
end
