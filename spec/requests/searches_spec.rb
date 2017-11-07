require 'rails_helper'

RSpec.describe "Searches", type: :request do
  describe "GET /" do
    it "works!" do
      get searches_path
      expect(response).to have_http_status(200)
    end
  end
end
