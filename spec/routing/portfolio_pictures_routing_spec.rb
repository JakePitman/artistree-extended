require "rails_helper"

RSpec.describe PortfolioPicturesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/portfolio_pictures").to route_to("portfolio_pictures#index")
    end

    it "routes to #new" do
      expect(:get => "/portfolio_pictures/new").to route_to("portfolio_pictures#new")
    end

    it "routes to #show" do
      expect(:get => "/portfolio_pictures/1").to route_to("portfolio_pictures#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/portfolio_pictures/1/edit").to route_to("portfolio_pictures#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/portfolio_pictures").to route_to("portfolio_pictures#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/portfolio_pictures/1").to route_to("portfolio_pictures#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/portfolio_pictures/1").to route_to("portfolio_pictures#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/portfolio_pictures/1").to route_to("portfolio_pictures#destroy", :id => "1")
    end

  end
end
