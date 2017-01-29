class V1::JamSessionsController < ApplicationController
  def show
    @jam_session = JamSession.find(params[:id])
    render json: { jam_session: @jam_session }, status: 200
  end

  def create
  end
end
