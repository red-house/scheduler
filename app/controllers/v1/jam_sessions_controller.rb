require_relative '../../services/schedule.rb'
class V1::JamSessionsController < ApplicationController
  def show
    @jam_session = JamSession.find(params[:id])
    render json: { jam_session: @jam_session }, status: 200
  end

  def create
    @jam_session = Services::Schedule.new.schedule_session(jam_session_params)
    if @jam_session.valid?
      render json: { jam_session: @jam_session } ,status: 201
    else
      errors = @jam_session.errors.messages
      render json: { errors: errors }, status: 400
    end
  end

  private

    def jam_session_params
      params.require(:jam_session).permit(:band_id, :band_member_id, :candidate_id, :start_time, :end_time)
    end
end
