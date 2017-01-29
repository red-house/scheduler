class V1::CandidatesController < ApplicationController
  def upcoming
    @jam_sessions = JamSession.for_candidate(params[:candidate_id]).upcoming
    render json: { jam_sessions: @jam_sessions }, status: 200
  end
end
