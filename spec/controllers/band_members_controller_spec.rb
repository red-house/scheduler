require 'rails_helper'

RSpec.describe V1::BandMembersController, type: :controller do
  describe "#upcoming" do
    let!(:past_jam_session) { create(:jam_session, band_member_id: 1) }
    let!(:upcoming_jam_session) do
      create(:jam_session, band_member_id: 1,
                           start_time: Time.zone.now+1.day,
                           end_time: Time.zone.now+26.hours)
    end
    let!(:upcoming_jam_session_another_band_member) do
      create(:jam_session, band_member_id: 2,
                           start_time: Time.zone.now+1.day,
                           end_time: Time.zone.now+26.hours)
    end

    it "responds with status 200" do
      get :upcoming, params: { band_member_id: 1 }
      expect(response.status).to be 200
    end

    it "responds with upcoming jam session for band member" do
      get :upcoming, params: { band_member_id: 1 }
      parsed_response = JSON.parse(response.body)['jam_sessions']
      expect(parsed_response.count).to be 1
      expect(parsed_response.first['band_member_id']).to be 1
    end
  end

end
