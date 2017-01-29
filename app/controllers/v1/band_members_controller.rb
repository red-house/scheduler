class V1::BandMembersController < ApplicationController
  def upcoming
    @jam_sessions = JamSession.for_band_member(params[:band_member_id]).upcoming
    render json: { jam_sessions: @jam_sessions }, status: 200
  end
end
