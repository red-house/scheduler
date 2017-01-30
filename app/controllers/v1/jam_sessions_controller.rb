class V1::JamSessionsController < ApplicationController
  rescue_from ActiveRecord::StatementInvalid, with: :handle_errors

  def show
    @jam_session = JamSession.find(params[:id])
    render json: { jam_session: @jam_session }, status: 200
  end

  def create
    @jam_session = JamSession.create(jam_session_params)
    if @jam_session.valid?
      render json: { jam_session: @jam_session } ,status: 201
    else
      errors = @jam_session.errors
      render json: { errors: errors }, status: 400
    end
  end

  protected
    def handle_errors(exception)
      errors = ''
      if exception.message =~ /one_session_duration_per_band_member/
        errors = 'time frame already scheduled for band member'
      else
        errors = e.message
      end
      render json: { errors: errors }, status: 400
    end

  private

    def jam_session_params
      params.require(:jam_session).permit(:band_id, :band_member_id, :candidate_id, :start_time, :end_time)
    end
end
