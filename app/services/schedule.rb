module Services
  class Schedule
    def schedule_session(jam_session_params)
      jam_session = JamSession.create(jam_session_params)
    rescue ActiveRecord::StatementInvalid => e
      if e.message =~ /one_session_duration_per_band_member/
        jam_session.errors.add(:duration, 'band member has a conflict for this time slot')
      end
    ensure
      jam_session
    end
  end
end
