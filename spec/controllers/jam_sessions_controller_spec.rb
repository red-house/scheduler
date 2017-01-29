require 'rails_helper'

RSpec.describe V1::JamSessionsController, type: :controller do
  let(:jam_session) { create(:jam_session) }

  describe "#show" do
    it "responds with success" do
      get :show, params: { id: jam_session.id }
      expect(response).to be_success
    end

    it "responds with json body" do
      get :show, params: { id: jam_session.id }
      parsed_response = JSON.parse(response.body)['jam_session']
      expect(parsed_response['id']).to eq jam_session.id
    end
  end

end
