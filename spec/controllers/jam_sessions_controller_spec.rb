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

  describe "#create" do
    let(:jam_session_attributes) { build(:jam_session).attributes }
    it "responds with 201" do
      post :create, params: { jam_session: jam_session_attributes }
      expect(response.status).to be 201
    end

    it "responds with jam_session in body" do
      post :create, params: { jam_session: jam_session_attributes }
      parsed_response = JSON.parse(response.body)['jam_session']
      expect(parsed_response['band_id']).to eq jam_session_attributes['band_id']
    end

    it "responds with 400 if there are errors" do
      post :create, params: { jam_session: { band_id: 1 } }
      expect(response.status).to be 400
    end

    it "responds with errors in body" do
      post :create, params: { jam_session: { band_id: 1 } }
      parsed_response = JSON.parse(response.body)['errors']
      expect(parsed_response['band_member_id']).to eq ["can't be blank"]
    end
  end

end
