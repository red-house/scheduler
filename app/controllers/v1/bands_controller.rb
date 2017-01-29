class V1::BandsController < ApplicationController
  def upcoming
    @jam_sessions = JamSession.for_band(params[:band_id]).upcoming
    render json: { jam_sessions: @jam_sessions }, status: 200
  end
end
