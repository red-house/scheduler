class JamSession < ApplicationRecord
  before_save :set_duration

  scope :for_band, ->(id) { where(band_id: id) }
  scope :for_band_member, ->(id) { where(band_member_id: id) }
  scope :for_candidate, ->(id) { where(candidate_id: id) }

  scope :upcoming, -> { where('start_time >= now()') }

  validates :band_id, :band_member_id, :candidate_id, :start_time, :end_time, presence: true

  def set_duration
    # include start_time, exclude end_time
    self.duration = (start_time...end_time)
  end
end
