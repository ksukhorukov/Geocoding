require 'rails_helper'
require 'json'

RSpec.describe SearchesController, type: :controller do

  let(:valid_params) {
    { location: 'Berlin' }
  }

  let(:invalid_params) {
    { location: 'non_existing_location'}
  }

  let(:error_message) {
    {status: 'error', message: 'location not found'}
  }

  let(:valid_response) {
    { status: 'ok', latitude: 52.52000659999999, longitude: 13.404954}
  }

  describe "GET #index" do
    it "returns a error message when location not found" do
      get :index, params: invalid_params
      result = JSON.parse(response.body).symbolize_keys
      expect(response).to be_success
      expect(result).to eq(error_message)
    end

    it "returns valid results with valid params" do
      get :index, params: valid_params
      result = JSON.parse(response.body).symbolize_keys
      expect(response).to be_success
      expect(result).to eq(valid_response)
    end
  end
end
