class JamSession < ApplicationRecord
  before_save :set_duration

  def set_duration
    # include start_time, exclude end_time
    self.duration = (start_time...end_time)
  end
end
