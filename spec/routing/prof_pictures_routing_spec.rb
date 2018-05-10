require "rails_helper"

RSpec.describe ProfPicturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/prof_pictures").to route_to("prof_pictures#index")
    end

    it "routes to #new" do
      expect(:get => "/prof_pictures/new").to route_to("prof_pictures#new")
    end

    it "routes to #show" do
      expect(:get => "/prof_pictures/1").to route_to("prof_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/prof_pictures/1/edit").to route_to("prof_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/prof_pictures").to route_to("prof_pictures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/prof_pictures/1").to route_to("prof_pictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/prof_pictures/1").to route_to("prof_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/prof_pictures/1").to route_to("prof_pictures#destroy", :id => "1")
    end

  end
end
