require "rails_helper"

RSpec.describe SearchesController, type: :routing do
  describe "routing" do
   it "routes to #index" do
      expect(:get => "/").to route_to("searches#index")
    end
  end
end
